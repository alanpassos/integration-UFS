using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebExercicio1.Startup))]
namespace WebExercicio1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
