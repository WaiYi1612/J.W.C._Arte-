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
    
    public partial class Customer_FavouriteGenre
    {
        public int Id { get; set; }
        public int cus_id { get; set; }
        public int artgenre_id { get; set; }
    
        public virtual ArtGenre ArtGenre { get; set; }
        public virtual Customer Customer { get; set; }
    }
}
