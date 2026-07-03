namespace TP_04.Models
{
    public class Figurita
    {
        public int IdFigurita { get; set; }
        public string Nombre { get; set; }
        public string Imagen { get; set; }
        public int IdPais { get; set; }
        public int IdJugador { get; set; }
        public bool Pegada { get; set; }
    }
}