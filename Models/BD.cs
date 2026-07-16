using Dapper;
using Microsoft.Data.SqlClient;

namespace TP_04.Models
{
    public static class BD
    {
        private static string _connectionString = @"Server=localhost;Database=AlbumMundial;Integrated Security=True;TrustServerCertificate=True;";

        public static List<Figurita> AbrirSobre()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"
                SELECT TOP 5
                    F.IdFigurita,
                    F.Imagen,
                    F.IdJugador,
                    F.IdPais,
                    F.Pegada,
                    J.Nombre,
                    J.Apellido,
                    J.Posicion,
                    P.Nombre AS Pais
                FROM Figurita F
                INNER JOIN Jugador J ON F.IdJugador = J.IdJugador
                INNER JOIN Pais P ON F.IdPais = P.IdPais
                ORDER BY NEWID();";

                return db.Query<Figurita>(sql).ToList();
            }
        }

        public static List<Figurita> ObtenerAlbum()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"
                SELECT
                    F.IdFigurita,
                    F.Imagen,
                    F.IdJugador,
                    F.IdPais,
                    F.Pegada,
                    J.Nombre,
                    J.Apellido,
                    J.Posicion,
                    P.Nombre AS Pais
                FROM Figurita F
                INNER JOIN Jugador J ON F.IdJugador = J.IdJugador
                INNER JOIN Pais P ON F.IdPais = P.IdPais
                ORDER BY F.IdFigurita;";

                return db.Query<Figurita>(sql).ToList();
            }
        }

        public static void PegarFigurita(int id)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"UPDATE Figurita
                               SET Pegada = 1
                               WHERE IdFigurita = @id;";

                db.Execute(sql, new { id });
            }
        }

        public static Figurita ObtenerFiguritaPorId(int id)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"
                SELECT 
                    F.IdFigurita,
                    F.Imagen,
                    F.IdJugador,
                    F.IdPais,
                    F.Pegada,
                    J.Nombre,
                    J.Apellido,
                    J.Posicion,
                    P.Nombre AS Pais
                FROM Figurita F
                INNER JOIN Jugador J ON F.IdJugador = J.IdJugador
                INNER JOIN Pais P ON F.IdPais = P.IdPais
                WHERE F.IdFigurita = @id;";

                return db.QueryFirstOrDefault<Figurita>(sql, new { id });
            }
        }

        public static void GuardarFigurita(int id)
        {
        }

        public static int CantidadPegadas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                return db.ExecuteScalar<int>(
                    "SELECT COUNT(*) FROM Figurita WHERE Pegada = 1");
            }
        }

        public static int CantidadFiguritas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                return db.ExecuteScalar<int>(
                    "SELECT COUNT(*) FROM Figurita");
            }
        }
        
    }
}