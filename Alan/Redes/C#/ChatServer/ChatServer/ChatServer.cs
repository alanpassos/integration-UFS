using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Threading;
using System.Collections;

namespace ChatServer
{
    public partial class ChatServer : Form
    {
        
        public ChatServer(IPAddress ip)
        {
            InitializeComponent();
        }
        private delegate void AtualizaStatusCallback(string strMensagem);

        private void btnAtender_Click(object sender, EventArgs e)
        {
            IPAddress enderecoIP = IPAddress.Parse(txt_log.Text);

            // Cria uma nova instância do objeto ChatServer
            ChatServer mainServidor = new ChatServer(enderecoIP);

            // Vincula o tratamento de evento StatusChanged a mainServer_StatusChanged
            ChatServer.StatusChanged += new StatusChangedEventHandler(mainServer_StatusChanged);

            // Inicia o atendimento das conexões
            mainServidor.IniciaAtendimento();

            // Mostra que nos iniciamos o atendimento para conexões
            txt_log.AppendText("Monitorando as conexões...\r\n");
        }
    }
}
