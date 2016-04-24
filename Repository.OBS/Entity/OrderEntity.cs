using System;

namespace Repository.OBS
{
    public class OrderEntity
    {
        public Guid Id { get; set; }

        public String StudentIds { get; set; }

        public Guid ExpId { get; set; }

        public String Time { get; set; }
    }
}
