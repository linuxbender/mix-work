using System.Web.Mvc;

namespace demo_00.Controllers.Home
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Willkommen bei ASP.NET MVC";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
