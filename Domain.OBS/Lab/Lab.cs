using System;

namespace Domain.OBS
{
    public class Lab
    {
        public Guid id { get; set; }

        public String Name { get; set; }

        public Guid CourseId { get; set; }

        public String DepId { get; set; }

        public Int16 LimitedNum { get; set; }

        public String Note { get; set; }

        public Boolean Flag { get; set; }
    }
}
