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
        public static Hospedagem hospedagemGlobal { get; set; }
    }

    public static class SuperClasses
    {

        public static List<Pessoa> pessoasAdicionadas { get; set; }
        public static List<Quarto> quartosListados { get; set; }
        public static int pacoteatual { get; set; }
        public static int quantidadePacote { get; set; }


    }
}