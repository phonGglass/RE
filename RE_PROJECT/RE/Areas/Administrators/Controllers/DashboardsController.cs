using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RE.Areas.Administrators.Controllers
{
    public class DashboardsController : Controller
    {
        // GET: Administrators/Dashboards
        public ActionResult Index()
        {
            return View();
        }
    }
}