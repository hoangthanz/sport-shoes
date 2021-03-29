using System;
using System.Runtime.Serialization;

namespace SportShoes.Utilities.Exceptions
{
    public class SportShoesException: Exception
    {

        public SportShoesException()
        {
        }

        public SportShoesException(string message) : base(message)
        {
        }

        public SportShoesException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected SportShoesException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}
