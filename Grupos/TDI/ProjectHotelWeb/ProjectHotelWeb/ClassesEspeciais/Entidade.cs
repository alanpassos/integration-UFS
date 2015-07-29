using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectHotelWeb.ClassesEspeciais
{
    public static class Entidade
    {
        public static Usuario usuarioAutenticado { get; set; }
        public static List<HistoricoAcesso> historicoAcessos { get; set; }
        public static List<Pessoa> PessoasAdicionadas { get; set; }
    }
}