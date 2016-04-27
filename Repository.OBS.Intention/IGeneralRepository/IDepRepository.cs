namespace Repository.OBS
{
    using Domain.OBS;
    using System;
    using System.Collections.Generic;

    public interface IDepRepository
    {
        void SaveOrUpdate(Dep dep);

        Boolean Delete(String id);

        Dep Get(String id);

        Dep GetByName(String name);

        List<Dep> Get();
    }
}
