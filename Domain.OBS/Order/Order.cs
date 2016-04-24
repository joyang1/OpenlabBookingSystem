using System;

namespace Domain.OBS
{
    public class Order
    {
        public Guid Id { get; set; }

        public String StudentIds { get; set; }

        public Guid ExpId { get; set; }

        public String Time { get; set; }
    }
}
