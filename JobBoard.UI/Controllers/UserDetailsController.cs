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
    public class UserDetailsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: UserDetails
        public ActionResult Index()
        {
            return Redirect("/UserDetails/Create");
        }



        // GET: UserDetails/Create
        public ActionResult Create()
        {
            string userID= User.Identity.GetUserId();
            
            var userDetailCheck = from x in db.UserDetails
                                  where x.UserID == userID
                                  select x;
            if (userDetailCheck.Count() !=0)
            {
                return Redirect("/UserDetails/Edit");
            }

            ViewBag.userID = userID;
            return View();
        }

        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserID,FirstName,LastName,ResumeFileName,PhotoFileName")] UserDetail userDetail)
        {
            if (ModelState.IsValid)
            {
                if (!userDetail.UserID.Equals(User.Identity.GetUserId()))
                {
                    return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
                }
                db.UserDetails.Add(userDetail);
                db.SaveChanges();
                return Redirect("/");
            }

            ViewBag.userID = userDetail.UserID;
            return View(userDetail);
        }

        // GET: UserDetails/Edit/5
        public ActionResult Edit()
        {
            string userID = User.Identity.GetUserId();
            UserDetail userDetail = db.UserDetails.Find(userID);


            return View(userDetail);
        }

        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserID,FirstName,LastName,ResumeFileName,PhotoFileName")] UserDetail userDetail)
        {
            if (ModelState.IsValid)
            {
                if (!userDetail.UserID.Equals(User.Identity.GetUserId()))
                {
                    return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
                }

                db.Entry(userDetail).State = EntityState.Modified;
                db.SaveChanges();
                return Redirect("/");
            }
            return View(userDetail);
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
