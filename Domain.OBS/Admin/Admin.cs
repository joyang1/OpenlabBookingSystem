using System;

namespace Domain.OBS
{
    public class Admin
    {
        public Guid Id { get; set; }

        public String Name { get; set; }

        public AdminPermission Permission { get; set; }

        public String Password { get; set; }
    }
}
