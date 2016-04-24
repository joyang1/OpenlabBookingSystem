using System;

namespace Domain.OBS
{
    public class StartedExpriment
    {
        public Guid Id { get; set; }

        public Guid ExpId { get; set; }

        public String Times { get; set; }

        public String Week { get; set; }

        public String Weekday { get; set; }

        public Guid LabId { get; set; }

        public Guid TeacherId { get; set; }

        public String Semester { get; set; }
    }
}
