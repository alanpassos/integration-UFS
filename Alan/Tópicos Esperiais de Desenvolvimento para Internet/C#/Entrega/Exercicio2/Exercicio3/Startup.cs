using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Exercicio3.Startup))]
namespace Exercicio3
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
