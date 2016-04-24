using System;
using Domain.OBS;

namespace Repository.OBS
{
    public class AdminEntity
    {
        public Guid Id { get; set; }

        public String Name { get; set; }

        public AdminPermission Permission { get; set; }

        public String Password { get; set; }
    }
}
