namespace Util.OBS
{
    using Database;
    using Microsoft.SqlServer.Management.Common;
    using Microsoft.SqlServer.Management.Smo;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.Common;
    using System.Data.SqlClient;
    using System.Diagnostics;

    public class DatabaseHelper : IDatabaseHelper
    {
        private readonly String connectionString;

        private readonly DbProviderFactory dbProviderFactory =
            DbProviderFactories.GetFactory("System.Data.SqlClient");

        public DatabaseHelper()
        {

        }

        public DatabaseHelper(String connectionString)
        {
            if (connectionString.IsNullOrEmpty())
            {
                throw new ArgumentNullException("connectionString");
            }
            this.connectionString = connectionString;
        }

        private DbConnection CreateConnection()
        {
            var connection = dbProviderFactory.CreateConnection();
            Debug.Assert(connection != null, "connection != null");
            connection.ConnectionString = this.connectionString;
            var needTry = true;
            var times = 0;
            while (needTry && times < 5)
            {
                try
                {
                    connection.Open();
                    needTry = false;
                }
                catch (Exception e)
                {
                    times++;
                }
            }
            return connection;
        }

        public Int32 ExecuteDatabaseScript(String sqlScript)
        {
            Int32 result;
            using (var connection = CreateConnection())
            {
                var serverConnection = new ServerConnection(connection as SqlConnection);
                var server = new Server(serverConnection);
                server.ConnectionContext.ExecuteNonQuery(sqlScript);
                result = 1;
            }
            return result;
        }

        public Int32 ExecuteDatabaseScriptWithTransaction(String sqlScript)
        {
            Int32 result;
            using (var connection = CreateConnection())
            {
                var serverConnection = new ServerConnection(connection as SqlConnection);
                try
                {
                    serverConnection.BeginTransaction();
                    var server = new Server(serverConnection);
                    server.ConnectionContext.ExecuteNonQuery(sqlScript);
                    serverConnection.CommitTransaction();
                    result = 1;
                }
                catch (Exception)
                {
                    serverConnection.RollBackTransaction();
                    throw;
                }
                finally
                {
                    serverConnection.Disconnect();
                }
            }
            return result;
        }

        /// <summary>
        ///     Warning:
        ///     构造DataTable中某一行的时候，Field构造顺序必须与数据库Column顺序一致
        /// </summary>
        /// <param name="tableRecords"></param>
        /// <param name="transactionContext"></param>
        public virtual void WriteToServer(DataTable tableRecords, TransactionContext transactionContext)
        {
            ProcessFaultHandler.Process(() =>
            {
                if (transactionContext == null)
                {
                    using (var connection = CreateConnection() as SqlConnection)
                    {
                        Debug.Assert(connection != null, "connection != null");

                        using (
                            var bulkCopy = new SqlBulkCopy(connection, SqlBulkCopyOptions.CheckConstraints | SqlBulkCopyOptions.UseInternalTransaction, null))
                        {
                            bulkCopy.BulkCopyTimeout = 5 * 60;
                            bulkCopy.BatchSize = tableRecords.Rows.Count;
                            bulkCopy.DestinationTableName = tableRecords.TableName;
                            bulkCopy.WriteToServer(tableRecords);
                        }
                    }
                }
                else
                {
                    using (
                        var bulkCopy = new SqlBulkCopy(transactionContext.Connection as SqlConnection,
                            SqlBulkCopyOptions.CheckConstraints, transactionContext.Transaction as SqlTransaction))
                    {
                        bulkCopy.BulkCopyTimeout = 5 * 60;
                        bulkCopy.BatchSize = tableRecords.Rows.Count;
                        bulkCopy.DestinationTableName = tableRecords.TableName;
                        bulkCopy.WriteToServer(tableRecords);
                    }
                }
            });
        }

        public void WriteToServer(DataTable tableRecords, SqlBulkCopyOptions option, TransactionContext transactionContext)
        {
            ProcessFaultHandler.Process(() =>
            {
                if (transactionContext == null)
                {
                    using (var connection = CreateConnection() as SqlConnection)
                    {
                        Debug.Assert(connection != null, "connection != null");

                        using (
                            var bulkCopy = new SqlBulkCopy(connection, SqlBulkCopyOptions.UseInternalTransaction, null))
                        {
                            bulkCopy.BulkCopyTimeout = 5 * 60;
                            bulkCopy.BatchSize = tableRecords.Rows.Count;
                            bulkCopy.DestinationTableName = tableRecords.TableName;
                            bulkCopy.WriteToServer(tableRecords);
                        }
                    }
                }
                else
                {
                    using (
                        var bulkCopy = new SqlBulkCopy(transactionContext.Connection as SqlConnection,
                            option, transactionContext.Transaction as SqlTransaction))
                    {
                        bulkCopy.BulkCopyTimeout = 5 * 60;
                        bulkCopy.BatchSize = tableRecords.Rows.Count;
                        bulkCopy.DestinationTableName = tableRecords.TableName;
                        bulkCopy.WriteToServer(tableRecords);
                    }
                }
            });
        }

        public TransactionContext CreateTransactionContext()
        {
            return new TransactionContext(CreateConnection());
        }

        public TransactionContext CreateTransactionContext(String connString)
        {
            var databaseHelper = new DatabaseHelper(connString);
            return new TransactionContext(databaseHelper.CreateConnection());
        }

        public DataSet ExecuteQuerySql(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext)
        {
            return ExecuteQuery(commandText, parameters, CommandType.Text, transactionContext);
        }

        public Int32 ExecuteNonQuerySql(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext)
        {
            return ExecuteNonQuery(commandText, parameters, CommandType.Text, transactionContext);
        }

        public void ExecuteReaderSql(
            Action<IDataReader> reader,
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext)
        {
            ExecuteReader(reader, commandText, parameters, CommandType.Text, transactionContext);
        }

        public TResult ExecuteScalarSql<TResult>(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext)
        {
            return ExecuteScalar<TResult>(commandText, parameters, CommandType.Text, transactionContext);
        }

        public DataSet ExecuteQuery(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext)
        {
            return ExecuteQuery(commandText, parameters, CommandType.StoredProcedure, transactionContext);
        }

        public Int32 ExecuteNonQuery(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext)
        {
            return ExecuteNonQuery(commandText, parameters, CommandType.StoredProcedure, transactionContext);
        }

        public void ExecuteReader(
            Action<IDataReader> reader,
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext)
        {
            ExecuteReader(reader, commandText, parameters, CommandType.StoredProcedure, transactionContext);
        }

        public TResult ExecuteScalar<TResult>(
            String commandText,
            Dictionary<String, Object> parameters,
            TransactionContext transactionContext)
        {
            return ExecuteScalar<TResult>(commandText, parameters, CommandType.StoredProcedure, transactionContext);
        }

        private Int32 ExecuteNonQuery(
            String commandText,
            Dictionary<String, Object> parameters,
            CommandType commandType,
            TransactionContext transactionContext)
        {
            var result = default(Int32);

            Execute(
                command => result = ProcessFaultHandler.Process<Int32>(command.ExecuteNonQuery),
                commandText,
                parameters,
                commandType,
                transactionContext);

            return result;
        }

        private void ExecuteReader(
            Action<IDataReader> reader,
            String commandText,
            Dictionary<String, Object> parameters,
            CommandType commandType,
            TransactionContext transactionContext)
        {
            Execute(command =>
            {
                using (var dr = command.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        reader(dr);
                    }
                }
            },
                commandText,
                parameters,
                commandType,
                transactionContext);
        }

        private TResult ExecuteScalar<TResult>(
            String commandText,
            Dictionary<String, Object> parameters,
            CommandType commandType,
            TransactionContext transactionContext)
        {
            var result = default(TResult);
            Execute(
                command => result = ProcessFaultHandler.Process(() => (TResult)command.ExecuteScalar()),
                commandText,
                parameters,
                commandType,
                transactionContext);
            return result;
        }

        private DataSet ExecuteQuery(
            String commandText,
            Dictionary<String, Object> parameters,
            CommandType commandType,
            TransactionContext transactionContext)
        {
            var result = new DataSet();
            var temp = result;
            Execute(command =>
            {
                result = ProcessFaultHandler.Process(() =>
                {
                    var adapter = dbProviderFactory.CreateDataAdapter();
                    Debug.Assert(adapter != null, "adapter != null");
                    adapter.SelectCommand = command;
                    adapter.Fill(temp);
                    return temp;
                });
            },
                commandText,
                parameters,
                commandType,
                transactionContext);
            return result;
        }

        private void Execute(
            Action<DbCommand> action,
            String commandText,
            Dictionary<String, Object> parameters,
            CommandType commandType,
            TransactionContext transactionContext)
        {
            ExecuteAction(action, commandText, parameters, commandType, transactionContext);
        }

        private void ExecuteAction(
            Action<DbCommand> action,
            String commandText,
            Dictionary<String, Object> parameters,
            CommandType commandType,
            TransactionContext transactionContext)
        {
            if (transactionContext == null)
            {
                using (var connection = CreateConnection())
                {
                    using (var command = connection.CreateCommand())
                    {
                        SetupCommand(command, commandText, parameters, commandType);
                        action(command);
                    }
                }
            }
            else
            {
                using (var command = transactionContext.Connection.CreateCommand())
                {
                    command.Transaction = transactionContext.Transaction;
                    SetupCommand(command, commandText, parameters, commandType);
                    action(command);
                }
            }
        }

        private void SetupCommand(
            DbCommand command,
            String commandText,
            Dictionary<String, Object> parameters,
            CommandType commandType)
        {
            command.CommandType = commandType;
            command.CommandText = commandText;
            command.CommandTimeout = 300;
            if (parameters != null)
            {
                if (command.Parameters.Count > 0)
                    command.Parameters.Clear();
                foreach (var parameter in parameters)
                {
                    var dbParameter = command.CreateParameter();
                    dbParameter.ParameterName = parameter.Key;
                    dbParameter.Value = parameter.Value ?? DBNull.Value;
                    command.Parameters.Add(dbParameter);
                }
            }
        }
    }
}
