namespace Util.OBS.Config
{
    using System;
    using System.Web.Configuration;

    public static class ObsConfigConfigurationManager
    {
        public static String GetConnectionString(String name)
        {
            var connectionStrings = WebConfigurationManager.ConnectionStrings[name];
            return connectionStrings != null ? connectionStrings.ConnectionString : null;
        }
    }
}
