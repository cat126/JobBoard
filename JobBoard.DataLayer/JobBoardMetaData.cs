using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobBoard.DataLayer
{
    public partial class ApplicationMetaData
    {
        [Required(ErrorMessage = "*")]
        public int OpenPositionID { get; set; }
        [Required(ErrorMessage = "*")]
        public string UserID { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Applied on")]
        public System.DateTime ApplicationDate { get; set; }
        [UIHint("MultineText")]
        [StringLength(2000, ErrorMessage = "value must be 2000 character or less.")]
        [Display(Name = "Manager Notes")]
        public string ManagerNotes { get; set; }
        [Required(ErrorMessage = "*")]
        public int ApplicationStatusID { get; set; }
        [DisplayFormat(NullDisplayText = "No File was given")]
        [Display(Name = "Resume")]
        public string ResumeFileName { get; set; }
    }
    [MetadataType(typeof(ApplicationMetaData))]
    public partial class Application { }

    public partial class ApplicationStatusMetaData
    {

        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "value must be 50 character or less.")]
        [Display(Name = "Status")]
        public string StatusName { get; set; }
        [StringLength(250, ErrorMessage = "value must be 250 character or less.")]
        public string StatusDescription { get; set; }
    }
    [MetadataType(typeof(ApplicationStatusMetaData))]
    public partial class ApplicationStatus { }

    public partial class CategoryMetaData
    {
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "value must be 50 character or less.")]
        [Display(Name = "Category")]
        public string CategoryName { get; set; }
        [StringLength(500, ErrorMessage = "value must be 500 character or less.")] 
        [UIHint("MultineText")]
        [Display(Name = "Description")]
        public string CategoryDescription { get; set; }
    }
    [MetadataType(typeof(CategoryMetaData))]
    public partial class Category { }

    public partial class LocationMetaData
    {
        [Required(ErrorMessage = "*")]
        public string ManagerID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "value must be 50 character or less.")]
        [Display(Name = "Location")]
        public string LocationName { get; set; }
        [Required(ErrorMessage = "*")]
        public decimal Latitude { get; set; }
        [Required(ErrorMessage = "*")]
        public decimal Longitude { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(1000, ErrorMessage = "value must be 1000 character or less.")]
        public string Address { get; set; }
    }
    [MetadataType(typeof(LocationMetaData))]
    public partial class Location { }

    public partial class OpenPositionMetaData
    {
        [Required(ErrorMessage = "*")]
        public int PositionID { get; set; }
        [Required(ErrorMessage = "*")]
        public int LocationID { get; set; }
    }
    [MetadataType(typeof(OpenPositionMetaData))]
    public partial class OpenPosition { }

    public partial class PositionMetaData
    {
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "value must be 50 character or less.")]
        public string Title { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Job Description")]
        public string JobDescription { get; set; }
        [Required(ErrorMessage = "*")]
        public int CategoryID { get; set; }
        [Display(Name = "Photo")]
        public string PhotoFileName { get; set; }
    }
    [MetadataType(typeof(PositionMetaData))]
    public partial class Position { }

    public partial class UserDetailMetaData
    {
        [Required(ErrorMessage = "*")]
        public string UserID { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "value must be 50 character or less.")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "value must be 50 character or less.")]
        public string LastName { get; set; }
        [Display(Name = "Resume")]
        public string ResumeFileName { get; set; }
        [Display(Name = "Photo")]
        public string PhotoFileName { get; set; }
    }
    [MetadataType(typeof(UserDetailMetaData))]
    public partial class UserDetail { }
}
