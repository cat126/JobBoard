using JobBoard.DataLayer;
using JobBoard.UI.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace JobBoard.UI.Controllers
{
    public class HomeController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();


        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.displayHeader = false;
            ViewBag.locationCount = (from x in db.Locations
                                     select x).Count();
            ViewBag.jobCount = (from x in db.OpenPositions
                                select x).Count();
            ViewBag.EmployeesCount = (from x in db.UserDetails
                                 select x).Count();
            ViewBag.Categories = db.Categories.ToList();
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";
            ViewBag.Message = ConfigurationManager.AppSettings.Get("MyKey");

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]//Makes sure the post is going to the same place as the get
        public ActionResult Contact(ContactViewModel cvm)
        {
            //When a class has validtion attributes that should be check before attempting to process any data
            if (!ModelState.IsValid)
            {
                return View(cvm);// we put cvm here so the forum is not wiped on a failed attempted
            }
            //start captcha code 
            string captchaResponse = Request.Form["g-recaptcha-response"];
            bool botcheckpassed = IsReCaptchValid(captchaResponse);
            if (!botcheckpassed)
            {
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\">You failed The bot test!</div>";
                return View(cvm);
            }
            //end captcha code

            string message = $"You have received an email from {cvm.Name} with a subject of {cvm.Subject}." +
                $"Please respond to {cvm.Email} with your response to the following message: <br /> {cvm.Message}";
            MailMessage mm = new MailMessage(ConfigurationManager.AppSettings.Get("emailFrom"), ConfigurationManager.AppSettings.Get("emailTo"), "You got a message from your website", message);

            //alow html formating in the email
            mm.IsBodyHtml = true;

            // The line blow is unnessary but I put it incase I want to change ther priorty latter
            mm.Priority = MailPriority.Normal;
            mm.ReplyToList.Add(cvm.Email);

            //SmtpClient setup
            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings.Get("emailServer"));
            //client credentials

            client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings.Get("emailFrom"), ConfigurationManager.AppSettings.Get("emailPassword"));

            //we need to handel the case were the mail server is not working
            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.Message = $"We are sorry. There was a error and your message was not sent. Please try again later Error:<br />{ex.StackTrace}";
                return View(cvm);
            }

            return View("EmailConfirmation", cvm);

        }
        public bool IsReCaptchValid(string captchaResponse)
        {
            //https://www.c-sharpcorner.com/article/integration-of-google-recaptcha-in-websites/
            //https://www.google.com/recaptcha/admin/site/347889823
            //https://developers.google.com/recaptcha/intro
            var result = false;
            //var captchaResponse = Request.Form["g-recaptcha-response"];
            var secretKey = ConfigurationManager.AppSettings["googleCaptchaSecretKey"];
            var apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
            var requestUri = string.Format(apiUrl, secretKey, captchaResponse);
            var request = (HttpWebRequest)WebRequest.Create(requestUri);

            using (WebResponse response = request.GetResponse())
            {
                using (StreamReader stream = new StreamReader(response.GetResponseStream()))
                {
                    JObject jResponse = JObject.Parse(stream.ReadToEnd());
                    var isSuccess = jResponse.Value<bool>("success");
                    result = (isSuccess) ? true : false;
                }
            }
            return result;
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
