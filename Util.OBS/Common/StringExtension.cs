namespace System
{
    public static class StringExtension
    {
        /// <summary>
        /// 判断字符串为空
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static Boolean IsNullOrEmpty(this String value)
        {
            return String.IsNullOrEmpty(value);
        }

        /// <summary>
        ///  判断字符串不为空
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static Boolean IsNotNullOrEmpty(this String value)
        {
            return !String.IsNullOrEmpty(value);
        }

        /// <summary>
        ///  Format string with args
        /// </summary>
        /// <param name="format"></param>
        /// <param name="args"></param>
        /// <returns></returns>
        public static String FormatWithArgs(this String format, params Object[] args)
        {
            return String.Format(format, args);
        }
    }
}
