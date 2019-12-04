using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobBoard.DataLayer;

namespace JobBoard.UI.Controllers
{
    public class LocationsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: Locations
        public ActionResult Index()
        {
            var locations = db.Locations.Include(l => l.UserDetail);
            return View(locations.ToList());
        }

        // GET: Locations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // GET: Locations/Create
        public ActionResult Create()
        {
            var managers = from x in db.AspNetUsers
                           where x.AspNetRoles.Where(y => y.Name == "Managers").Count() > 0
                           select x;

            ViewBag.Managers = managers.ToList();
            return View();
        }

        // POST: Locations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LocationName,ManagerID,Latitude,Longitude,Address")] Location location, HttpPostedFileBase PhotoFile)
        {
            if (ModelState.IsValid)
            {
                if (PhotoFile != null)
                {
                    location.PhotoFileName = FileUpload.UploadImageFile(PhotoFile, Server, "/Content/Uploaded/img/");
                }
                db.Locations.Add(location);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            var managers = from x in db.AspNetUsers
                           where x.AspNetRoles.Where(y => y.Name == "Managers").Count() > 0
                           select x;

            ViewBag.Managers = managers.ToList();

            return View(location);
        }

        // GET: Locations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            var managers = from x in db.AspNetUsers
                           where x.AspNetRoles.Where(y => y.Name == "Managers").Count() > 0
                           select x;
            ViewBag.Managers = managers.ToList();
            return View(location);
        }

        // POST: Locations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LocationName,LocationID,ManagerID,Latitude,Longitude,Address")] Location location, HttpPostedFileBase PhotoFile)
        {
            if (ModelState.IsValid)
            {
                if (PhotoFile != null)
                {
                    location.PhotoFileName = FileUpload.UploadImageFile(PhotoFile, Server, "/Content/Uploaded/img/");
                }
                else
                {
                    string oldFileName = (from x in db.Locations
                                          where x.LocationID == location.LocationID
                                          select x.PhotoFileName).Single();
                    location.PhotoFileName = oldFileName;
                }
                db.Entry(location).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var managers = from x in db.AspNetUsers
                           where x.AspNetRoles.Where(y => y.Name == "Managers").Count() > 0
                           select x;
            ViewBag.Managers = managers.ToList();
            return View(location);
        }

        // GET: Locations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // POST: Locations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Location location = db.Locations.Find(id);
            db.Locations.Remove(location);
            db.SaveChanges();
            return RedirectToAction("Index");
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
