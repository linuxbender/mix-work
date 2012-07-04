using System.Web.Mvc;
using System.Web.Routing;
using demo_00.ViewEngine;
using demo_00.Controllers.Modul01;

namespace demo_00
{
    // Hinweis: Anweisungen zum Aktivieren des klassischen Modus von IIS6 oder IIS7 
    // finden Sie unter "http://go.microsoft.com/?LinkId=9394801".

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");            
            routes.MapRoute(
                "Default", // Routenname
                "{name}/{controller}/{action}/{id}", // URL mit Parametern
                new { name = "Home", controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { typeof(Demo01Controller).Namespace}
                // Parameterstandardwerte
            );

        }

        protected void Application_Start()
        {
            ViewEngines.Engines.Clear();
            ViewEngines.Engines.Add(new RazorViewEngineAppName());
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }
    }
}