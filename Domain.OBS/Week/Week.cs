using System;

namespace Domain.OBS
{
    public class Week
    {
        public Guid Id { get; set; }

        public Int32 StartedWeek { get; set; }

        public Int32 EndedWeek { get; set; }

        public String RestedWeek { get; set; }
    }
}
