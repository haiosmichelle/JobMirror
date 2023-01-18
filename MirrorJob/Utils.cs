using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MirrorJob
{
    public class Utils
    {
        public static bool IsValidExtension(string fileName)
        {
            bool isValid = false;
            string[] fileExtension = { ".jpg", ".png", ".jpeg" };
            for (int I = 0; I <= fileExtension.Length - 1; I++)
            {
                if (fileName.Contains(fileExtension[I]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }
        public static bool IsValidResume(string fileName)
        {
            bool isValid = false;
            string[] fileExtension = { ".doc", ".docx", ".pdf" };
            for (int I = 0; I <= fileExtension.Length - 1; I++)
            {
                if (fileName.Contains(fileExtension[I]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }

    }
}