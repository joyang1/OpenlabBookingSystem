namespace Util.OBS
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;

    public interface IDatabaseHelper
    {
        Int32 ExecuteDatabaseScript(String sqlScript);

        void WriteToServer(DataTable tableRecords, TransactionContext transactionContext);

        void WriteToServer(DataTable tableRecords, SqlBulkCopyOptions option, TransactionContext transactionContext);

        TransactionContext CreateTransactionContext();

        TransactionContext CreateTransactionContext(String connectionString);

        DataSet ExecuteQuerySql(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext);

        Int32 ExecuteNonQuerySql(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext);

        Int32 ExecuteDatabaseScriptWithTransaction(String sqlScript);

        void ExecuteReaderSql(
            Action<IDataReader> reader,
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext);

        TResult ExecuteScalarSql<TResult>(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext);

        DataSet ExecuteQuery(
            String commandName,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext);

        Int32 ExecuteNonQuery(
            String commandName,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext);

        void ExecuteReader(
            Action<IDataReader> reader,
            String commandName,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext);

        TResult ExecuteScalar<TResult>(
            String commandName,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext);
    }
}
