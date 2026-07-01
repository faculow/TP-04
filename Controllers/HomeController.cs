using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_04.Models;

namespace TP_04.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    private readonly BD bd = new BD();

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.TotalPegadas = bd.CantidadPegadas();
        ViewBag.TotalFiguritas = bd.CantidadFiguritas();

        List<Figurita> album = bd.ObtenerAlbum();

        return View(album);
    }

    public IActionResult AbrirSobre()
    {
        List<Figurita> sobre = bd.AbrirSobre();

        return View(sobre);
    }

    [HttpPost]
    public IActionResult Confirmar(List<int> pegar, List<int> repetidas)
    {
        bd.ConfirmarFiguritas(pegar, repetidas);

        return RedirectToAction("Index");
    }

    public IActionResult BaseFiguritas()
    {
        List<Figurita> figuritas = bd.ObtenerFiguritas();

        return View(figuritas);
    }

    public IActionResult Repetidas()
    {
        List<Figurita> repetidas = bd.ObtenerRepetidas();

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