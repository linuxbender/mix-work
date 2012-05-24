/*
 *
 * author : daniel glenn <glenn@starwolf.ch>
 * projekt : ActionExcel
 * 29.05.2011
 *
 */

using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Starwolf.Ch.App.ActionExcel.Models.ActionExcel;
using Starwolf.Ch.App.ActionExcel.Models.Tbl;

namespace HAR.Controllers
{
    /// <summary>
    /// only action from the controller can trigger the action
    /// </summary>
    [ChildActionOnly]
    public class ExcelController : ExcelBase
    {
        /// <summary>
        /// ToDo Excel Export, using _LayoutExcel as default masterpage
        /// with unique filename
        /// </summary>
        /// <param name="model">tblTodo</param>
        /// <returns></returns>
        public ExcelResult ToDoListExport(List<tblToDo> model)
        {
            ExcelName = string.Format("ToDoList-{0}.xls",DateTime.Now.Ticks);
            return Excel("ToDoList", model, "_LayoutExcel");
        }
        /// <summary>
        /// Analysis Excel Export , using _LayoutExcel as default masterpage
        /// with unique filename
        /// </summary>
        /// <param name="model">tblAnalysis</param>
        /// <returns></returns>
        public ExcelResult ToDoListExport(List<tblAnalysis> model)
        {
            ExcelName = string.Format("AnalysisList-{0}.xls", DateTime.Now.Ticks);
            return Excel("AnalysisList", model, "_LayoutExcel");
        }
    }//end of class
}//end of namespace

