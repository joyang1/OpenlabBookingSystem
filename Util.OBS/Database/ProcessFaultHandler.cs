namespace Util.OBS
{
    using System;
    using System.Threading;

    public static class ProcessFaultHandler
    {
        public static TResult Process<TResult>(Func<TResult> func, Int32 retryMaxCount = 3)
        {
            return Process(typeof(Type), type => func(), retryMaxCount);
        }

        public static TResult Process<TParam, TResult>
            (TParam param, Func<TParam, TResult> func, Int32 retryMaxCount = 3)
        {
            var result = default(TResult);
            for (var retryCount = 0; retryCount < retryMaxCount; retryCount++)
            {
                try
                {
                    result = func(param);
                    break;
                }
                catch
                {
                    if (retryCount == retryMaxCount - 1)
                    {
                        throw;
                    }
                    Thread.Sleep(1000);
                }
            }
            return result;
        }

        public static void Process(Action action, Int32 retryMaxCount = 20)
        {
            Process(typeof(Type), type => action(), retryMaxCount);
        }

        public static void Process<TParam>(
            TParam parameter, Action<TParam> action, Int32 retryMaxCount = 20)
        {
            for (var retryCount = 0; retryCount < retryMaxCount; retryCount++)
            {
                try
                {
                    action(parameter);
                    return;
                }
                catch
                {
                    if (retryCount == retryMaxCount - 1)
                        throw;
                    Thread.Sleep(3000);
                }
            }
        }
    }
}
