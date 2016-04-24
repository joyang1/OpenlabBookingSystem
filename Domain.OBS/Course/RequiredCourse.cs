using System;

namespace Domain.OBS
{
    public class RequiredCourse
    {
        public Guid Id { get; set; }

        public String Name { get; set; }

        public String GradeIds { get; set; }

        public String DepIds { get; set; }
    }
}
