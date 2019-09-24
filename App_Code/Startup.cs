using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(rotary_district_3141_Responsive.Startup))]
namespace rotary_district_3141_Responsive
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
