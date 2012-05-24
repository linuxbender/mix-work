using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Ch.Heroku.Entities
{
    [DisplayColumn("RoleName")]
    public class Role
    {

        [Required]
        public int Id { get; set; }

        [Display(Name = "Role Name")]
        [Required(ErrorMessage = "Role Name is required",AllowEmptyStrings = true)]
        [MaxLength(100, ErrorMessage = "max is  100")]
        public string RoleName { get; set; }

        [MaxLength(8, ErrorMessage = "max is 8")]
        public DateTime ModifedAt { get; set; }

        [ForeignKey("Id")]
        public virtual ICollection<User> Users { get; set; }
    }
}