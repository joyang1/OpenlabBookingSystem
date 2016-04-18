namespace Util.OBS
{
    using global::Castle.Windsor;

    public class IocContainerCastle
    {
        private static readonly IWindsorContainer container = new WindsorContainer();

        public static IWindsorContainer Container
        {
            get { return container; }
        }
    }
}
