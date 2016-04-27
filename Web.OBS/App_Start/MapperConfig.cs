namespace Web.OBS
{
    using AutoMapper;
    using Repository.OBS;
    using System;

    public class MapperConfig
    {
        private static Boolean initAutoMpper;
        public static void Setup()
        {
            if (initAutoMpper) return;
            try
            {
                Mapper.AddProfile(new OBSRepositoryMapperProfile());
                Mapper.AssertConfigurationIsValid();
                initAutoMpper = true;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}