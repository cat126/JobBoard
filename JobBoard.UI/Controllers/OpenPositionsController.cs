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
    public class OpenPositionsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: OpenPositions
        public ActionResult Index(string categoriesSearch, string titleSearch, string locationSearch)
        {
            var openPositions = db.OpenPositions.Include(o => o.Location).Include(o => o.Position);

            if (!string.IsNullOrEmpty(categoriesSearch))
            {
                openPositions = openPositions.Where(x=>x.Position.Category.CategoryName.Contains(categoriesSearch));
            }
            if (!string.IsNullOrEmpty(titleSearch))
            {
                openPositions = openPositions.Where(x=>x.Position.Title.Contains(titleSearch));
            }
            if (!string.IsNullOrEmpty(locationSearch))
            {
                openPositions = openPositions.Where(x => x.Location.LocationName.Contains(locationSearch));
            }
            return View(openPositions.ToList());
        }

        // GET: OpenPositions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            return View(openPosition);
        }

        // GET: OpenPositions/Create
        [Authorize(Roles = "Admin, Managers")]
        public ActionResult Create()
        {
            string userID = User.Identity.GetUserId();
            var locations = db.Locations.Where(x=>true);

            if (!User.IsInRole("Admin"))
            {
                // the user is not an admin
                locations = locations.Where(x=>x.ManagerID==userID);

            }
            if (locations.Count()==0)
            {
                return RedirectToAction("ErrorNotAManager");
            }
            ViewBag.LocationID = new SelectList(locations, "LocationID", "LocationName");
            ViewBag.PositionID = new SelectList(db.Positions, "PositionID", "Title");
            return View();
        }

        // POST: OpenPositions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Managers")]
        public ActionResult Create([Bind(Include = "OpenPositionID,PositionID,LocationID")] OpenPosition openPosition)
        {
            string userID = User.Identity.GetUserId();
            var locations = db.Locations.Where(x => true);

            if (!User.IsInRole("Admin"))
            {
                // the user is not an admin
                locations = locations.Where(x => x.ManagerID == userID);

            }
            if (locations.Count() == 0)
            {
                return RedirectToAction("ErrorNotAManager");
            }
            var locationCheck = from x in locations
                                where x.LocationID == openPosition.LocationID
                                select x;
            if (locationCheck.Count()==0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }
            if (ModelState.IsValid)
            {
                db.OpenPositions.Add(openPosition);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationID = new SelectList(locations, "LocationID", "LocationName", openPosition.LocationID);
            ViewBag.PositionID = new SelectList(db.Positions, "PositionID", "Title", openPosition.PositionID);
            return View(openPosition);
        }


        // GET: OpenPositions/Delete/5
        [Authorize(Roles = "Admin, Managers")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            if (openPosition.Location.ManagerID!= User.Identity.GetUserId()&&!User.IsInRole("Admin"))
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }
            return View(openPosition);
        }

        // POST: OpenPositions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Managers")]
        public ActionResult DeleteConfirmed(int id)
        {
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition.Location.ManagerID != User.Identity.GetUserId() && !User.IsInRole("Admin"))
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }
            db.OpenPositions.Remove(openPosition);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [Authorize]
        public ActionResult Apply(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            string userID = User.Identity.GetUserId();
            var applicationCheck = from x in db.Applications
                                   where x.UserID == userID && x.OpenPositionID == openPosition.OpenPositionID
                                   select x;
            if (applicationCheck.Count()==0)
            {
                Application application = new Application();
                application.ApplicationDate = DateTime.Now;
                application.ApplicationStatusID = 1;
                application.ResumeFileName = (from x in db.UserDetails
                                              where x.UserID == userID
                                              select x.ResumeFileName).Single();
                application.UserID = userID;
                application.OpenPositionID = openPosition.OpenPositionID;
                db.Applications.Add(application);
                db.SaveChanges();
                ViewBag.Message = "You have successfully applied";
            }
            else
            {
                ViewBag.Message = "You have already applied";
            }
            
            return View();
        }
        public ActionResult ErrorNotAManager()
        {
            return View();
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
