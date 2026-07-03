using System;
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
        public void CrearPaquete(List<Figurita> todasLasFiguritas)
        {
            Random azar = new Random();
            while (Figuritas.Count < 5)
            {
                int posicionAleatoria = azar.Next(0, todasLasFiguritas.Count);
                Figurita f = todasLasFiguritas[posicionAleatoria];
                if (Figuritas.Contains(f) == false)
                {
                    Figuritas.Add(f);
                }
            }
        }
    }
}