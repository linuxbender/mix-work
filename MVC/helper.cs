using System;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace demo_15.Helper
{
    public static class Helpers
    {
        public static MvcHtmlString isRequiredFor<TModel, TProperty>(this HtmlHelper<TModel> helper, 
            Expression<Func<TModel, TProperty>> expression, string symbol = "*", string cssClass = "editor-field")
        {
            var result = new TagBuilder("span");
            var attributs = ModelMetadata.FromLambdaExpression(expression, helper.ViewData);
            if (attributs.IsRequired)
            {
                result.AddCssClass(cssClass);
                result.InnerHtml = symbol;
            }
            return new MvcHtmlString(result.ToString(TagRenderMode.Normal));
        }
    }
}