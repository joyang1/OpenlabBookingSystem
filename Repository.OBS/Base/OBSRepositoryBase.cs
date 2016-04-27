namespace Repository.OBS
{
    using AutoMapper;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using Util.OBS;
    using Util.OBS.Config;

    internal abstract class OBSRepositoryBase
    {

        private String databaseSchema;
        private DatabaseHelper adaDatabaseHelper;

        protected String DatabaseSchema
        {
            get
            {
                if (databaseSchema.IsNullOrEmpty())
                {
                    databaseSchema = "OBS";
                }
                return databaseSchema;
            }
        }

        protected IDatabaseHelper AdaDatabaseHelper
        {
            get
            {
                if (this.adaDatabaseHelper != null) return this.adaDatabaseHelper;
                var connectionString = ObsConfigConfigurationManager.GetConnectionString("connectionStrings");
                this.adaDatabaseHelper = new DatabaseHelper(connectionString);
                return this.adaDatabaseHelper;
            }
        }

        protected Boolean IsExistedCurrentRecord<TEntity>(Dictionary<String, Object> parameters = null, String whereString = "")
        {
            var sql = "SELECT CASE WHEN EXISTS(SELECT Id FROM {0} {1}) THEN 1 ELSE 0 END".FormatWithArgs(this.GetOBSTableName<TEntity>(), whereString);
            return AdaDatabaseHelper.ExecuteScalarSql<Int32>(ApplySchemaToSql(sql), parameters, null) > 0;
        }

        public Boolean CheckDataSetIsNull(DataSet ds)
        {
            return ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0;
        }

        public static TEntity ConvertToEntity<TDomain, TEntity>(TDomain domain)
        {
            return Convert<TDomain, TEntity>(domain);
        }

        public static TDomain ConvertToDomain<TEntity, TDomain>(TEntity entity)
        {
            return Convert<TEntity, TDomain>(entity);
        }

        private static TDestination Convert<TSource, TDestination>(TSource srcObject)
        {
            return Mapper.Map<TDestination>(srcObject);
        }

        public virtual String GetTableName<TElement>()
        {
            var tableName = typeof(TElement).Name.Replace("Entity", "s");
            return "[{0}].[{1}]".FormatWithArgs("dbo", tableName);
        }

        public String ApplySchemaToSql(String sqlQuery)
        {
            return sqlQuery.FormatWithArgs(DatabaseSchema);
        }

        public String ApplySchemaToFunction(String functionName)
        {
            return functionName.FormatWithArgs(DatabaseSchema);
        }

        public virtual String GetOBSTableName<TEntity>()
        {
            String tableName;
            var entity = typeof(TEntity).Name;
            var character = entity.ElementAt(entity.IndexOf("Entity", StringComparison.Ordinal) - 1);
            if (character.Equals('s') || character.Equals('x'))
            {
                tableName = entity.Replace("Entity", "") + "es";
            }
            else if (character.Equals('y'))
            {
                tableName = entity.Replace("Entity", "").Substring(0, entity.Length - 2) + "ies";
            }
            else
            {
                tableName = entity.Replace("Entity", "") + "s";
            }
            return "[{0}]." + "[" + tableName + "]";
        }

        public Guid GenerateKeyId()
        {
            return Guid.NewGuid();
        }

        public String EncryptPassword(String plainString)
        {
            return String.Empty;
        }

        public String DecryptPassword(String encryptedString)
        {
           
            return String.Empty;
        }

        public TResult Process<TResult>(Func<TResult> func)
        {
            try
            {
                return func();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public void Process(Action action)
        {
            try
            {
                action();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
