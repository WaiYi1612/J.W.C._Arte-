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
    
    public partial class aspnet_Paths
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public aspnet_Paths()
        {
            this.aspnet_PersonalizationPerUser = new HashSet<aspnet_PersonalizationPerUser>();
        }
    
        public System.Guid ApplicationId { get; set; }
        public System.Guid PathId { get; set; }
        public string Path { get; set; }
        public string LoweredPath { get; set; }
    
        public virtual aspnet_Applications aspnet_Applications { get; set; }
        public virtual aspnet_PersonalizationAllUsers aspnet_PersonalizationAllUsers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<aspnet_PersonalizationPerUser> aspnet_PersonalizationPerUser { get; set; }
    }
}
