using System.Web.Mvc;

namespace demo_00.Areas.demo
{
    public class demoAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "demo";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "demo_default",
                "demo/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
