using IdentitySample.Models;
using System.Data.Entity;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using ProjectHotelWeb.Models;
using ExemploWEB.App_Start;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

using ExemploWEB.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectHotelWeb.ClassesEspeciais;
using Dominio.Classes;

namespace IdentitySample
{
    // Note: For instructions on enabling IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=301868
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {

            #region estâncias de estaticas
            Entidade.hospedagemGlobal = null;
            SuperCheckin.pessoasAdicionadas = new List<Pessoa>();
            SuperCheckin.quartosListados = new List<Quarto>();
            SuperCheckin.pacoteatual = 0;
            SuperCheckin.quantidadePacote = 0;

            SuperCheckout.hospedagensIniciais= new List<Hospedagem>();
            SuperCheckout.hospedagemSeleionada = new List<Hospedagem>();
            SuperCheckout.pessoasSelecionadas = new List<Pessoa>();
            SuperCheckout.controleServicosSelecionados = new List<ControleServico>();
            #endregion

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
            if (!roleManager.RoleExists("Gerente"))
            {
                UserRole newRole = new UserRole("Gerente", "Nível elevado de acesso");
                roleManager.Create(newRole);
            }
            if (!roleManager.RoleExists("Recepcionista"))
            {
                UserRole newRole = new UserRole("Recepcionista", "Nível médio de acesso");
                roleManager.Create(newRole);
            }
            if (!roleManager.RoleExists("Convidado"))
            {
                UserRole newRole = new UserRole("Convidado", "Nível básico de acesso");
                roleManager.Create(newRole);
            }
        }
    }
}
