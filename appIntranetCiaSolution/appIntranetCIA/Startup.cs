using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(appIntranetCIA.Startup))]
namespace appIntranetCIA
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            //ConfigureAuth(app);
        }
    }
}
