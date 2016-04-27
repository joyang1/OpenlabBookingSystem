namespace Repository.OBS
{
    using Domain.OBS;
    using System;
    using System.Collections.Generic;

    public interface IMajorRepository
    {
        void SaveOrUpdate(Major major);

        Boolean Delete(String id);

        Major Get(String id);

        Major GetByName(String name);

        List<Major> Get();
    }
}