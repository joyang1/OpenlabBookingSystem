using System;

namespace Repository.OBS
{
    public class RequiredCourseEntity
    {
        public Guid Id { get; set; }

        public String Name { get; set; }

        public String GradeIds { get; set; }

        public String DepIds { get; set; }
    }
}
