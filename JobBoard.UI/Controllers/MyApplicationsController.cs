using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobBoard.DataLayer;
using Microsoft.AspNet.Identity;

namespace JobBoard.UI.Controllers
{
    [Authorize]
    public class MyApplicationsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: MyApplications
        public ActionResult Index()
        {
            string userID = User.Identity.GetUserId();
            var applications = db.Applications.Include(a => a.ApplicationStatu).Include(a => a.OpenPosition).Include(a => a.UserDetail);
            applications=applications.Where(x=>x.UserID== userID);
            return View(applications.ToList());
        }

        
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
