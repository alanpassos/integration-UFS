﻿using Dominio.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Interfaces
{
   public interface IControleServicos : IRepositorio<ControleServico>
    {
       void Cadastrar(ControleServico controleServico);
       void Atualizar(ControleServico controleServico);
       void Remover(ControleServico controleServico);
       ControleServico ResultadoUnico(int idServico);
    }
}
