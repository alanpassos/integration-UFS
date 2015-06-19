using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Exercicio2.Startup))]
namespace Exercicio2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
