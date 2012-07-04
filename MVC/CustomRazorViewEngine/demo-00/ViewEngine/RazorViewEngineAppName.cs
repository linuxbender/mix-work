using System.Web.Mvc;

namespace demo_00.ViewEngine
{
    public class RazorViewEngineAppName : RazorViewEngine
    {
        public RazorViewEngineAppName()
            : base()
        {
            ViewLocationFormats = new[] {
                "~/Views/%1/{1}/{0}.cshtml",                
                "~/Views/Shared/{0}.cshtml"                
            };

            MasterLocationFormats = new[] {
                "~/Views/%1/{1}/{0}.cshtml",             
                "~/Views/Shared/{0}.cshtml"                
            };

            PartialViewLocationFormats = new[] {
                "~/Views/%1/{1}/{0}.cshtml",                
                "~/Views/Shared/{0}.cshtml"             
            };
        }

        /// <summary>
        /// replace path with the new view pattern - for PartialView
        /// </summary>
        /// <param name="controllerContext">ControllerContext object</param>
        /// <param name="partialPath">string</param>
        /// <returns>IView</returns>
        protected override IView CreatePartialView(ControllerContext controllerContext, string partialPath)
        {
            var nameSpace = PlaceHolder(controllerContext.Controller.GetType().Namespace);            
            return base.CreatePartialView(controllerContext, partialPath.Replace("%1", nameSpace));
        }
        
        /// <summary>
        /// replace path with the new view pattern - for CreateView
        /// </summary>
        /// <param name="controllerContext">ControllerContext object</param>
        /// <param name="viewPath">string</param>
        /// <param name="masterPath">string</param>
        /// <returns>IView</returns>
        protected override IView CreateView(ControllerContext controllerContext, string viewPath, string masterPath)
        {
            var nameSpace = PlaceHolder(controllerContext.Controller.GetType().Namespace);
            return base.CreateView(controllerContext, viewPath.Replace("%1", nameSpace), masterPath.Replace("%1", nameSpace));
        }

        /// <summary>
        /// replace path with the new view pattern - for FileExists
        /// </summary>
        /// <param name="controllerContext">ControllerContext object</param>
        /// <param name="virtualPath">string</param>
        /// <returns>bool</returns>
        protected override bool FileExists(ControllerContext controllerContext, string virtualPath)
        {
            var nameSpace = PlaceHolder(controllerContext.Controller.GetType().Namespace);           
            return base.FileExists(controllerContext, virtualPath.Replace("%1", nameSpace));
        }

        /// <summary>
        /// search folder name from the controller namespace
        /// only one Sub-Folder is allowed and required (after Controller)
        /// AppName.Com.Controller.MySubFolderName
        /// </summary>
        /// <param name="Namespace">string</param>
        /// <returns>string</returns>
        private string PlaceHolder(string Namespace)
        {
            var startIndex = Namespace.LastIndexOf(".") + 1;
            return Namespace.Substring(startIndex);
        }
    }
}