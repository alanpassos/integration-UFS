﻿using Dominio.Interfaces;
using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
    public interface IServicos : IRepositorio<Servico>
    {
        void Cadastrar(Servico servico);
        void Atualizar(Servico servico);
        void Remover(Servico servico);
        Servico ResultadoUnico(int idServico);
    }
}