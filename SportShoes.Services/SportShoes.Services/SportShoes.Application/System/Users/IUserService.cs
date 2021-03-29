
using SportShoes.Application.ViewModels;
using SportShoes.Application.ViewModels.Users;
using System.Threading.Tasks;

namespace SportShoes.Application.System.Users
{
    public interface IUserService
    {

        Task<string> Authencate(LoginRequest request);

        Task<string> AuthencateForClient(LoginRequest request);

        Task<bool> Register(AppUserViewModel request);

    }
}
