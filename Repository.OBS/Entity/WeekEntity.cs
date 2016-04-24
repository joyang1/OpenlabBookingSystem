using System;

namespace Repository.OBS
{
    public class WeekEntity
    {
        public Guid Id { get; set; }

        public Int32 StartedWeek { get; set; }

        public Int32 EndedWeek { get; set; }

        public String RestedWeek { get; set; }
    }
}
