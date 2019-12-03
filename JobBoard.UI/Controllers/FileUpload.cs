using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JobBoard.UI
{
    public class FileUpload
    {
        public static string UploadImageFile(HttpPostedFileBase theFile, HttpServerUtilityBase Server, string folderPath)
        {
            
                string fileName = theFile.FileName;
                string ext = fileName.Substring(fileName.LastIndexOf("."));
                string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                if (goodExts.Contains(ext.ToLower()))
                {
                    fileName = Guid.NewGuid() + ext;
                    theFile.SaveAs(Server.MapPath(folderPath + fileName));
                    return folderPath + fileName;
                }
                else
                {
                    return "default.jpg";
                }

                
            
            
        }
    }
}