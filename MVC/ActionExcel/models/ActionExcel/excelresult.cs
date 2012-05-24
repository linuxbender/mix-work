/*
 *
 * author : daniel glenn <glenn@starwolf.ch>
 * projekt : ActionExcel
 * 29.05.2011
 *
 */
using System;
using System.Text;
using System.Collections.Generic;
using System.Web.Mvc;
using System.IO;

namespace Starwolf.Ch.App.ActionExcel.Models.ActionExcel
{
    public class ExcelResult : ViewResult
    {
        private readonly IExcelInterceptor _interceptor;
        private IView _htmlView;
        private string _htmlViewName;
        public readonly ExcelMessage Excel;
        public readonly IExcelSender ExcelSender;
        public readonly Encoding ExcelEncoding;

        public ExcelResult(IExcelInterceptor interceptor, IExcelSender sender, ExcelMessage excel, string viewName, string masterName, Encoding messageEncoding)
        {
            ViewName = viewName ?? ViewName;
            MasterName = masterName ?? MasterName;
            ExcelEncoding = messageEncoding;
            Excel = excel;
            ExcelSender = sender;
            _interceptor = interceptor;

        }

        public override void ExecuteResult(ControllerContext context)
        {
            AddMessageViews(context);
        }
        /// <summary>
        /// Deliver as sync
        /// </summary>
        public void Deliver()
        {
            Deliver(Excel, false);
        }

        private void Deliver(ExcelMessage excel, bool async)
        {
            var excelContext = new ExcelSendingContext(excel);
            _interceptor.BeforeExcelSending(excelContext);
            if(excelContext.Cancel)
            {
                return;
            }
            if (async)
            {
                ExcelSender.SendAsync(excel, AsyncSendCompleted);
                return;
            }
            _interceptor.AfterExcelSend(excel);
        }

        private void AsyncSendCompleted(ExcelMessage excel)
        {
            _interceptor.AfterExcelSend(excel);
            ExcelSender.Dispose();
        }
        /// <summary>
        /// Search and Render View as string and set result as property to ExcelDocument
        /// </summary>
        /// <param name="context"></param>
        private void AddMessageViews(ControllerContext context)
        {
            if (context == null)
                throw new ArgumentNullException("context is null in class ExcelResult");

            LocateViews(context);

            if (_htmlView == null)
            {
                throw new ArgumentNullException("View is null in class ExcelResult");
            }
            if (_htmlView != null)
            {
                var body = RenderViewAsString(context, _htmlView);
                Excel.ExcelDocument = body;
            }
        }
        /// <summary>
        /// Render the view as string
        /// </summary>
        /// <param name="context">current http context</param>
        /// <param name="view">valid view</param>
        /// <returns></returns>
        private string RenderViewAsString(ControllerContext context, IView view)
        {
            using (StringWriter sw = new StringWriter())
            {
                var viewContext = new ViewContext(context,view,ViewData,TempData,sw);
                view.Render(viewContext, sw);
                return sw.GetStringBuilder().ToString();
            }
        }
        /// <summary>
        /// Search the view
        /// </summary>
        /// <param name="context">current http context</param>
        private void LocateViews(ControllerContext context)
        {
            if (context == null)
                throw new ArgumentNullException("context is null in method LocalteViews in class ExcelResult");
            if (string.IsNullOrEmpty(ViewName))
                ViewName = context.RouteData.GetRequiredString("action");

            _htmlViewName = String.Format("{0}.excel", ViewName);

            //var ExcelViewResult = ViewEngines.Engines.FindPartialView(context, _htmlViewName);
            var ExcelViewResult = ViewEngines.Engines.FindView(context,_htmlViewName,MasterName);
            if (ExcelViewResult != null)
            {
                _htmlView = ExcelViewResult.View;
            }
            else
                throw new ArgumentNullException("PartialView Result isnull");
        }
    }//end of class
}//end of namespace

