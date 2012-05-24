﻿/*
 *
 * author : daniel glenn <glenn@starwolf.ch>
 * projekt : ActionExcel
 * 29.05.2011
 *
 */
using System;
using System.IO;
using System.Text;

namespace Starwolf.Ch.App.ActionExcel.Models.ActionExcel
{
    public class Excel
    {
        private StringBuilder sb;
        private StringWriter excel;

        public Excel()
        {
            sb = new StringBuilder();
            excel = new StringWriter(sb);
        }

        public string Context()
        {
            excel.Flush();
            return sb.ToString();
        }
    }//end of class
}//end of namespace

