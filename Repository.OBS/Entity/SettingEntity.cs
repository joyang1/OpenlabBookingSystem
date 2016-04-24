using System;
namespace Repository.OBS
{
    public class SettingEntity
    {
        public Guid Id { get; set; }

        public Int32 StartedTime { get; set; }

        public Int32 StudentChangedTime { get; set; }

        public Int32 TeacherChangedTime { get; set; }

        public Int32 EndTime { get; set; }
    }
}
