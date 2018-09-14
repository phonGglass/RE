using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RE.Models;

namespace RE.Areas.Administrators.Controllers
{
    public class DashboardsController : Controller
    {
        private RealEstateEntities db = new RealEstateEntities();
        // GET: Administrators/Dashboards
        public ActionResult Index()
        {
            
            return View(db.ACCOUNTs.ToList());
        }
    }
}