namespace System
{
    public static class StringExtension
    {
        public static Boolean IsNullOrEmpty(this String value)
        {
            return String.IsNullOrEmpty(value);
        }

        public static Boolean IsNotNullOrEmpty(this String value)
        {
            return !String.IsNullOrEmpty(value);
        }
    }
}
