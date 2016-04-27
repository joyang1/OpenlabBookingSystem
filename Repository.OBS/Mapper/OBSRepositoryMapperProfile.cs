namespace Repository.OBS
{
    using AutoMapper;
    using Domain.OBS;
    using System;

    public class OBSRepositoryMapperProfile : Profile
    {
        public override String ProfileName
        {
            get { return "OBSRepositoryMapperProfile"; }
        }

        protected override void Configure()
        {
            #region Dep
            CreateMap<Dep, DepEntity>();
            CreateMap<DepEntity, Dep>();
            #endregion Dep
        }
    }
}