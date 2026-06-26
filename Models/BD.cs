using System.Collections.Generic;

namespace TP_04.Models
{
    public static class BD
    {
        public static List<Figurita> Album = new List<Figurita>();

        public static List<Figurita> Repetidas = new List<Figurita>();

        public static List<Figurita> Pendientes = new List<Figurita>();

        public static List<Figurita> SobreActual = new List<Figurita>();

        public static List<Figurita> ObtenerAlbum()
        {
            return Album;
        }

        public static List<Figurita> ObtenerRepetidas()
        {
            return Repetidas;
        }

        public static List<Figurita> ObtenerPendientes()
        {
            return Pendientes;
        }

        public static List<Figurita> ObtenerSobreActual()
        {
            return SobreActual;
        }

        public static int CantidadPegadas()
        {
            return Album.Count;
        }

        public static int CantidadRepetidas()
        {
            return Repetidas.Count;
        }
        public static int CantidadFiguritas()
        {
            return 64;
        }
    }
}