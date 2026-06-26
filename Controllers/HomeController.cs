using System.Diagnostics;
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
        List<Figurita> lista = BD.ObtenerFiguritas();

        return View(lista);
    }

    public IActionResult Repetidas()
    {
        List<Figurita> lista = BD.ObtenerRepetidas();

        return View(lista);
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