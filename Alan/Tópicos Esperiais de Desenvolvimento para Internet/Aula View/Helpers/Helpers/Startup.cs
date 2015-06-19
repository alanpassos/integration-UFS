using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Helpers.Startup))]
namespace Helpers
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
