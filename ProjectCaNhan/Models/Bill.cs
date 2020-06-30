namespace ProjectCaNhan.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bill")]
    public partial class Bill
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bill()
        {
            BillsDetails = new HashSet<BillsDetail>();
        }

        [Key]
        public int Bill_ID { get; set; }

        [Required]
        [StringLength(50)]
        public string CustomerName { get; set; }

        [Required]
        [StringLength(50)]
        public string Address { get; set; }

        [Column(TypeName = "date")]
        public DateTime DayOrder { get; set; }

        public int Total { get; set; }

        [Required]
        [StringLength(50)]
        public string Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillsDetail> BillsDetails { get; set; }
    }
}
