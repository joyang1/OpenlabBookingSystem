using System;

namespace Domain.OBS
{
    public class Course
    {
        public Guid Id { get; set; }

        public String Name { get; set; }

        public Int16 Period { get; set; }

        public String Description { get; set; }

        public Guid TeacherId { get; set; }

        public CourseQuality Quality { get; set; }

        public Int16 RequiredNum { get; set; }

        public Int16 LimitedNum { get; set; }

        public Int16 OptionalNum { get; set; }

        public String DepId { get; set; }
    }
}
