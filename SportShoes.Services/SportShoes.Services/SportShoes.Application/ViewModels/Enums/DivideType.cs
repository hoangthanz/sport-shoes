using System.ComponentModel;

namespace SportShoes.Application.ViewModels
{
    public enum  DivideType
    {
        [Description(",")]
        Comma,
        [Description(";")]
        SemiColon,
        [Description(" ")]
        Space
    }
}
