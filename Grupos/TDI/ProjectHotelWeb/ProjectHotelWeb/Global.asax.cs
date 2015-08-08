using ExemploWEB.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using ProjectHotelWeb.ClassesEspeciais;
using Dominio.Classes;

namespace ProjectHotelWeb
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            #region estâncias de estaticas
            Entidade.hospedagemGlobal = null;
            SuperClasses.pessoasAdicionadas = new List<Pessoa>();
            SuperClasses.quartosListados = new List<Quarto>();
            SuperClasses.pacoteatual = 0;
            SuperClasses.quantidadePacote = 0;
            #endregion

            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            ControllerBuilder.Current.SetControllerFactory(new AppConfig());
        }
    }
}
