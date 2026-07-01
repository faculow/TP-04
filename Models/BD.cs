using Dapper;
using Microsoft.Data.SqlClient;

namespace TP_04.Models
{
    public class BD
    {
        private string _connectionString =
            @"Server=localhost;Database=AlbumMundial;Trusted_Connection=True;TrustServerCertificate=True;";

        public List<Figurita> ObtenerFiguritas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"SELECT *
                               FROM Figurita
                               ORDER BY NumeroAlbum";

                return db.Query<Figurita>(sql).ToList();
            }
        }

        public List<Figurita> ObtenerAlbum()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"SELECT F.*
                               FROM Figurita F
                               INNER JOIN FiguritaPegada P
                               ON F.IdFigurita = P.IdFigurita
                               ORDER BY F.NumeroAlbum";

                return db.Query<Figurita>(sql).ToList();
            }
        }

        public List<Figurita> AbrirSobre()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"SELECT TOP 7 *
                               FROM Figurita
                               ORDER BY NEWID()";

                return db.Query<Figurita>(sql).ToList();
            }
        }

        public int PegarFigurita(int idFigurita)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"INSERT INTO FiguritaPegada
                               (IdFigurita)
                               VALUES
                               (@idFigurita)";

                return db.Execute(sql, new
                {
                    idFigurita = idFigurita
                });
            }
        }

        public int AgregarRepetida(int idFigurita)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"INSERT INTO FiguritaRepetida
                               (IdFigurita)
                               VALUES
                               (@idFigurita)";

                return db.Execute(sql, new
                {
                    idFigurita = idFigurita
                });
            }
        }

        public int AgregarPendiente(int idFigurita)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"INSERT INTO FiguritaPendiente
                               (IdFigurita)
                               VALUES
                               (@idFigurita)";

                return db.Execute(sql, new
                {
                    idFigurita = idFigurita
                });
            }
        }

        public List<Figurita> ObtenerRepetidas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"SELECT F.*
                               FROM Figurita F
                               INNER JOIN FiguritaRepetida R
                               ON F.IdFigurita = R.IdFigurita
                               ORDER BY F.NumeroAlbum";

                return db.Query<Figurita>(sql).ToList();
            }
        }

        public int CantidadPegadas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"SELECT COUNT(*)
                               FROM FiguritaPegada";

                return db.ExecuteScalar<int>(sql);
            }
        }

        public int CantidadFiguritas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"SELECT COUNT(*)
                               FROM Figurita";

                return db.ExecuteScalar<int>(sql);
            }
        }

        public void ConfirmarFiguritas(List<int> pegar, List<int> repetidas)
        {
            if (pegar != null)
            {
                foreach (int id in pegar)
                {
                    PegarFigurita(id);
                }
            }

            if (repetidas != null)
            {
                foreach (int id in repetidas)
                {
                    AgregarRepetida(id);
                }
            }
        }
    }
}