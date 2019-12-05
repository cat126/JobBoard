using JobBoard.DataLayer;
using System.Linq;
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
            ViewBag.Categories = db.Categories.ToList();
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
