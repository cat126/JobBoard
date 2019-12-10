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
    [Authorize(Roles ="Admin, Managers")]
    public class ApplicationsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: Applications
        public ActionResult Index()
        {
            var applications = db.Applications.Include(a => a.ApplicationStatu).Include(a => a.OpenPosition).Include(a => a.UserDetail);
            string userID = User.Identity.GetUserId();


            if (!User.IsInRole("Admin"))
            {
                // the user is not an admin
                applications = from x in applications
                               where x.OpenPosition.Location.ManagerID == userID
                               select x;

            }
            return View(applications.ToList());
        }

        // GET: Applications/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }


        // GET: Applications/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            string userID = User.Identity.GetUserId();
            if (!User.IsInRole("Admin"))
            {
                // the user is not an admin
                if (userID!=application.OpenPosition.Location.ManagerID)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
                }

            }
            ViewBag.ApplicationStatusID = new SelectList(db.ApplicationStatus1, "ApplicationStatusID", "StatusName", application.ApplicationStatusID);
            ViewBag.UserID = new SelectList(db.UserDetails, "UserID", "FirstName", application.UserID);
            return View(application);
        }

        // POST: Applications/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ApplicationID,OpenPositionID,UserID,ApplicationDate,ManagerNotes,ApplicationStatusID,ResumeFileName")] Application application)
        {
            if (ModelState.IsValid)
            {
                // we don't want the users to be able to edit all of the fields so we have to got back and get those read only fields
                // geting two instances of the same object from the same instnce of JobBoardEntities cause errors so we create a  secound JobBoardEntities
                using (JobBoardEntities db2 = new JobBoardEntities())
                {



                    Application oldApplication = (from x in db2.Applications
                                                  where x.ApplicationID == application.ApplicationID
                                                  select x).Single();
                    application.ApplicationDate = oldApplication.ApplicationDate;
                    application.OpenPositionID = oldApplication.OpenPositionID;
                    application.UserID = oldApplication.UserID;
                    application.ResumeFileName = oldApplication.ResumeFileName;

                    string userID = User.Identity.GetUserId();
                    if (!User.IsInRole("Admin"))
                    {
                        // the user is not an admin
                        if (userID != oldApplication.OpenPosition.Location.ManagerID)
                        {
                            return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
                        }

                    }
                }
                db.Entry(application).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ApplicationStatusID = new SelectList(db.ApplicationStatus1, "ApplicationStatusID", "StatusName", application.ApplicationStatusID);
            ViewBag.UserID = new SelectList(db.UserDetails, "UserID", "FirstName", application.UserID);
            return View(application);
        }

        // GET: Applications/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }

        // POST: Applications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Application application = db.Applications.Find(id);
            db.Applications.Remove(application);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        [AllowAnonymous]
        public JsonResult AjaxEdit(int id, string comment, int statusID)
        {
            //db.Entry(publisher).State = EntityState.Modified;
            //db.SaveChanges();
            //return Json(publisher);
            Application application = (from x in db.Applications
                                       where x.ApplicationID == id
                                       select x).Single();
            var statusCheck = from x in db.ApplicationStatus1
                              where x.ApplicationStatusID == statusID
                              select x;
            if (statusCheck.Count() == 1)
            {
                application.ApplicationStatusID = statusCheck.Single().ApplicationStatusID;
            }
            application.ManagerNotes = comment;

            db.Entry(application).State = EntityState.Modified;
            db.SaveChanges();

            return Json(true);
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
