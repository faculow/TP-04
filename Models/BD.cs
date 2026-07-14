using Dapper;
using Microsoft.Data.SqlClient;

public static class BD
{
    private string_connectionString = @"Server=localhost; Database=AlbumMundial; Integrated Security=True; TrustServerCertificate=True;";

    public static List<int> AbrirSobre()
    {
        List<int> sobre = new List<int>();
        SqlDataAdapter adaptador = new SqlDataAdapter("SELECT TOP 5 IdFigurita FROM Figurita ORDER BY NEWID()", conexion);
        DataTable tabla = new DataTable();
        adaptador.Fill(tabla);
        for (int i = 0; i < tabla.Rows.Count; i++)
        {
            int numero = Convert.ToInt32(tabla.Rows[i]["IdFigurita"]);
            sobre.Add(numero);
        }
        return sobre;
    }

    public static void GuardarFigurita(int id)
    {
        Console.WriteLine("Figurita guardada: " + id);
    }

    public static void PegarFigurita(int id)
    {
        Console.WriteLine("Figurita pegada: " + id);
    }
}