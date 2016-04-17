namespace Util.OBS
{
    using System;
    using System.Data;
    using System.Data.Common;

    public class TransactionContext : IDisposable
    {
        internal DbConnection Connection { get; private set;}
        internal DbTransaction Transaction { get; private set; }

        internal TransactionContext(DbConnection connection)
        {
            Connection = connection;
            Transaction = Connection.BeginTransaction();
        }

        internal TransactionContext(DbConnection connection, IsolationLevel isolationLevel)
        {
            Connection = connection;
            Transaction = Connection.BeginTransaction(isolationLevel);
        }

        public void Dispose()
        {
            Connection.Dispose();
            Transaction.Dispose();
        }

        public void Commit()
        {
            Transaction.Commit();
        }

        public void Rollback()
        {
            Transaction.Rollback();
        }
    }
}
