using System.Collections.Generic;

namespace TP_04.Models
{
    public class Sobre
    {
        public int IdSobre { get; set; }

        public List<Figurita> Figuritas { get; set; }

        public Sobre()
        {
            Figuritas = new List<Figurita>();
        }
    }
}