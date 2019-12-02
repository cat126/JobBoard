﻿using System;
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
        public System.DateTime ApplicationDate { get; set; }
        //[UIHint()]
        //TODO Bruce Smith add code to make this muit line
        [StringLength(2000, ErrorMessage = "value must be 2000 character or less.")]
        public string ManagerNotes { get; set; }
        [Required(ErrorMessage = "*")]
        public int ApplicationStatusID { get; set; }
        [DisplayFormat(NullDisplayText = "No File was given")]
        public string ResumeFileName { get; set; }
    }
    [MetadataType(typeof(ApplicationMetaData))]
    public partial class Application { }

    public partial class ApplicationStatusMetaData
    {

        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "value must be 50 character or less.")]
        public string StatusName { get; set; }
        [StringLength(250, ErrorMessage = "value must be 250 character or less.")]
        public string StatusDescription { get; set; }
    }
    [MetadataType(typeof(ApplicationStatusMetaData))]
    public partial class ApplicationStatus { }

    public partial class Category
    {
    }
 }