using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NestedGridviews.Startup))]
namespace NestedGridviews
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
