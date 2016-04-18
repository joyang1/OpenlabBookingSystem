namespace Repository.OBS
{
    using Domain.OBS;
    using System;

    public class StudentEntity
    {
        public String Id { get; set; }

        public String Name { get; set; }

        public Sex Sex { get; set; }

        public String Birth { get; set; }

        public String DepId { get; set; }

        public String MajorId { get; set; }

        public String GradeId { get; set; }

        public Int32 Year { get; set; }

        public String IdNumber { get; set; }
    }
}
