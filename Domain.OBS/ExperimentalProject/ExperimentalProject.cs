using System;

namespace Domain.OBS
{
    public class ExperimentalProject
    {
        public Guid Id { get; set; }

        public String Name { get; set; }

        public Int16 Period { get; set; }

        public Int32 MinNum { get; set; }

        public Int32 MaxNum { get; set; }

        public String Description { get; set; }

        public String Requirement { get; set; }

        public String Purpose { get; set; }

        public ExperimentalProjectQuality Quality { get; set; }

        public Boolean IsStartedByGrade { get; set; }

        public Guid CourseId { get; set; }
    }
}
