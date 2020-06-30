using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectCaNhan.Models
{
    public class CustomerModel
    {
        [Key]
        public int ID { set; get; }
        [Required(ErrorMessage ="Required")]
        public string Username { set; get; }
        [Required(ErrorMessage ="Required")]
        public string Password { set; get; }
        [Compare("Password", ErrorMessage ="It is not the same as Password, please check again")]
        public string ConfirmPassword { set; get; }
        [Required(ErrorMessage ="Required")]
        public string Name { set; get; }
        [Required(ErrorMessage ="Required")]
        [EmailAddress]
        public string Email { set; get; }
        [Required(ErrorMessage ="Required")]
        [RegularExpression(@"((09|03|05|07|08|02)+([0-9]{8}))", ErrorMessage = "Phone Number Is Invalid")]
        public string Phone { set; get; }
        [Required(ErrorMessage = "Required")]
        public string Address { set; get; }
    }
}