//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WAD.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Artist
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Artist()
        {
            this.Artist_Genre = new HashSet<Artist_Genre>();
        }
    
        public int id { get; set; }
        public string address { get; set; }
        public string image { get; set; }
        public Nullable<System.Guid> userid { get; set; }
        public int first_time_login { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Artist_Genre> Artist_Genre { get; set; }
    }
}
