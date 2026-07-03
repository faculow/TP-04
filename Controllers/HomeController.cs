using System.Diagnostics;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using TP_04.Models;

namespace TP_04.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.TotalPegadas = BD.CantidadPegadas();
        ViewBag.TotalFiguritas = BD.CantidadFiguritas();

        List<Figurita> album = BD.ObtenerAlbum();

        return View(album);
    }

    public IActionResult AbrirSobre()
    {
        List<Figurita> sobre = BD.AbrirSobre();

        return View(sobre);
    }

    [HttpPost]
    public IActionResult Confirmar(List<int> pegar, List<int> repetidas)
    {
        BD.ConfirmarFiguritas(pegar, repetidas);

        return RedirectToAction("Index");
    }

    public IActionResult BaseFiguritas()
    {
        List<Figurita> figuritas = BD.ObtenerFiguritas();

        return View(figuritas);
    }

    public IActionResult Repetidas()
    {
        List<Figurita> repetidas = BD.ObtenerRepetidas();

        return View(repetidas);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel
        {
            RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier
        });
    }
}