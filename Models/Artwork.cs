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
    
    public partial class Artwork
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Artwork()
        {
            this.OrderCarts = new HashSet<OrderCart>();
            this.WishLists = new HashSet<WishList>();
        }
    
        public int artwork_id { get; set; }
        public string name { get; set; }
        public byte[] image { get; set; }
        public string status { get; set; }
        public int price { get; set; }
        public System.DateTime published_date { get; set; }
        public int size_height { get; set; }
        public int size_width { get; set; }
        public int quantity { get; set; }
        public Nullable<System.DateTime> added_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public Nullable<int> artist_id { get; set; }
        public int gallery_id { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderCart> OrderCarts { get; set; }
        public virtual Gallery Gallery { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WishList> WishLists { get; set; }
    }
}
