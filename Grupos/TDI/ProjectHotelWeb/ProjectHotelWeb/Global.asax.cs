using IdentitySample.Models;
using System.Data.Entity;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using ProjectHotelWeb.Models;
using ExemploWEB.App_Start;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace IdentitySample
{
    // Note: For instructions on enabling IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=301868
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

             ControllerBuilder.Current.SetControllerFactory(new AppConfig());

            UserDbContext db = new UserDbContext();
            RoleStore<UserRole> roleStore = new RoleStore<UserRole>(db);
            RoleManager<UserRole> roleManager = new RoleManager<UserRole>(roleStore);

           
            if (!roleManager.RoleExists("Administrador"))
            {
                UserRole newRole = new UserRole("Administrador", "Nível máximo de acesso");
                roleManager.Create(newRole);
            }
            else if (!roleManager.RoleExists("Gerente"))
            {
                UserRole newRole = new UserRole("Gerente", "Nível elevado de acesso");
            }
            else if (!roleManager.RoleExists("Recepcionista"))
            {
                UserRole newRole = new UserRole("Recepcionista", "Nível médio de acesso");
                roleManager.Create(newRole);
            }
            else if (!roleManager.RoleExists("Convidado"))
            {
                UserRole newRole = new UserRole("Convidado", "Nível básico de acesso");
                roleManager.Create(newRole);
            }
        }
    }
}
