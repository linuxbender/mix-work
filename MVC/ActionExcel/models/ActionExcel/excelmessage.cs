/*
 *
 * author : daniel glenn <glenn@starwolf.ch>
 * projekt : ActionExcel
 * 29.05.2011
 *
 */
using System.Text;
using System.Web;

namespace Starwolf.Ch.App.ActionExcel.Models.ActionExcel
{
    /// <summary>
    /// Excel Message object
    /// </summary>
    public class ExcelMessage
    {
        public string ExcelDocument { get; set; }
        public HttpContextBase HttpContextBase { get; set; }
        public string ExcelName { get; set; }
        public string MimeType { get; set; }
        public Encoding ExcelEncoding { get; set; }
    }//end of class
}//end of namespace

