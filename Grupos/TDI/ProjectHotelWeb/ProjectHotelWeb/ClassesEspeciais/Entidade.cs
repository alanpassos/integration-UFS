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

    public static class SuperCheckin
    {

        public static List<Pessoa> pessoasAdicionadas { get; set; }
        public static List<Quarto> quartosListados { get; set; }
        public static int pacoteatual { get; set; }
        public static int quantidadePacote { get; set; }


    }
    public static class SuperCheckout
    {

        public static List<Pessoa> pessoasSelecionadas { get; set; }
        public static List<Hospedagem> hospedagemSeleionada { get; set; }
        public static List<Hospedagem> hospedagensIniciais { get; set; }
        public static List<ControleServico> controleServicosSelecionados { get; set; }
        

    }
}