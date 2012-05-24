/*
 *
 * author : daniel glenn <glenn@starwolf.ch>
 * projekt : ActionExcel
 * 29.05.2011
 *
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.Mvc;
using System.Web.Routing;

namespace Starwolf.Ch.App.ActionExcel.Models.ActionExcel
{
    /// <summary>
    /// excel controller - based on the opensource project actionmailer .NET
    /// </summary>
    public class ExcelBase : ControllerBase, IExcelInterceptor
    {
        /// <summary>
        /// Property to hold the Encoding value
        /// </summary>
        public Encoding ExcelEncoding { get; set;}
        /// <summary>
        /// Property to hold the HttpContext
        /// </summary>
        public HttpContextBase HttpContextBase {get; set;}
        /// <summary>
        /// Property to hold the Excel File name
        /// </summary>
        public string ExcelName { get; set; }
        /// <summary>
        /// Property to hold Mime Type
        /// </summary>
        public string MimeType { get; set; }
        /// <summary>
        /// Interface ref
        /// </summary>
        public IExcelSender ExcelSender { get; set; }
        /// <summary>
        ///  Method call befor sending Excel
        /// </summary>
        /// <param name="context"></param>
        protected virtual void BeforeExcelSending(ExcelSendingContext context) { }
        /// <summary>
        ///  Method call after sending Excel
        /// </summary>
        /// <param name="excel"></param>
        protected virtual void AfterExcelSend(ExcelMessage excel) { }
        /// <summary>
        ///  Implementation IExcelInterceptor
        /// </summary>
        /// <param name="context"></param>
        void IExcelInterceptor.BeforeExcelSending(ExcelSendingContext context)
        {
            BeforeExcelSending(context);
        }
        /// <summary>
        /// Implementation IExcelInterceptor
        /// </summary>
        /// <param name="excel"></param>
        void IExcelInterceptor.AfterExcelSend(ExcelMessage excel)
        {
            AfterExcelSend(excel);
        }
        /// <summary>
        /// Initializes ExcelBase  Controller
        /// </summary>
        /// <param name="defaultExcelEncoding"></param>
        public ExcelBase(IExcelSender excelSender =  null, Encoding defaultExcelEncoding = null)
        {
            ExcelSender = excelSender ?? new ResponseExcelSender();
            ExcelEncoding = defaultExcelEncoding ?? Encoding.Default;

            if (HttpContext.Current != null)
            {
                HttpContextBase = new HttpContextWrapper(HttpContext.Current);
            }
        }
        /// <summary>
        /// main method to run excel export
        /// </summary>
        /// <param name="viewName"></param>
        /// <param name="model"></param>
        /// <param name="masterName"></param>
        /// <returns></returns>
        public virtual ExcelResult Excel(string viewName, object model = null, string masterName = null)
        {
            if (viewName == null)
                throw new ArgumentNullException("viewName param ist null");

            var excel = new ExcelMessage();

            excel.ExcelName = ExcelName;
            excel.HttpContextBase = HttpContextBase;
            // set default value - if is not set in the controller
            excel.MimeType = MimeType ?? "application/ms-excel";
            // set default encoding - if is not set in the controller
            excel.ExcelEncoding = ExcelEncoding ?? System.Text.Encoding.UTF8;

            var result = new ExcelResult(this, ExcelSender, excel, viewName, masterName, ExcelEncoding);

            ViewData.Model = model;
            result.ViewData = ViewData;

            var routeData = new RouteData();
            //routeData.DataTokens["area"] = null;
            routeData.DataTokens["area"] = FindAreaName();

            routeData.Values["controller"] = GetType().Name.Replace("Controller",string.Empty);
            routeData.Values["action"] = viewName;

            var requestContext = new RequestContext(HttpContextBase, routeData);
            ControllerContext = new ControllerContext(requestContext, this);

            result.ExecuteResult(ControllerContext);
            return result;

        }//end of Excel

        private string FindAreaName()
        {
            var name = GetType().Namespace;
            if (name != null && name.Contains(".Areas."))
            {
                var startIndex = name.IndexOf(".Areas.") + 7;
                var length = name.LastIndexOf(".") - startIndex;
                return name.Substring(startIndex, length);
            }
            return null;
        }

        protected override void ExecuteCore() { }
    }//end of class
}//end of namespace

