namespace Repository.OBS
{
    using Domain.OBS;
    using System;

    public class TeacherEntity
    {
        public Guid Id { get; set; }

        public String Name { get; set; }

        public String Password { get; set; }

        public Sex Sex { get; set; }

        public String Phone { get; set; }

        public String Email { get; set; }

        public String DepId { get; set; }

        public TeacherPermission Permission { get; set; }

        public Boolean Flag { get; set; }
    }
}
