

	import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

	public class ServidorAutoritativo   implements Runnable {

		public ServidorAutoritativo () {
			Thread thread = new Thread(this);
			thread.start();

		}

		public static void main(String[] args) {
			new ServidorRaiz();
		}

		@Override
		public void run() {
			System.out.println("Servidor iniciado com sucesso");
			try {
				ServerSocket servidor = new ServerSocket(9090);
				ReceberDados(servidor);
				
				
			} catch (IOException e) {
				System.out.println("Probelmas no servidor: " + e);

			}

		}

		private void ReceberDados(ServerSocket servidor) {
			try{
			Socket cli;
			while (true) {
				cli = servidor.accept();
				

				// rECEBENDO DADOS DO CLIENTE(eNTRADA DE DADOS)
				DataInputStream inpCli = new DataInputStream(
						cli.getInputStream());

				System.out
				.println("\n######################   SERVIDOR   ###############################\n");
				String mensagem = inpCli.readUTF();
				System.out.println("RECEBENDO MENSAGEM DO CLIENTE:\n IP ["		+ cli.getInetAddress() + "]: " + mensagem);
				System.out
				.println("\n######################   SERVIDOR   ###############################\n");
				// enviando mensagem para o cliente
				System.out.println("ENVIANDO MENSAGEM AO CLIENTE\n");
				DataOutputStream outCli = new DataOutputStream(cli.getOutputStream());
				outCli.writeUTF("sigaa.ufs.br");
				outCli.writeUTF("192.168.0.102");
				
				
				cli.close();
				outCli.close();
				servidor.close();
				// SE O CLIENTE MANDAR A MENSAGEM FIM ENTÃO IRA PARAR O SERVIDOR
				if (mensagem.equalsIgnoreCase("fim")) {
					servidor.close();
					System.out.println("Servidor finalizado");
					break;
				}
			}
			}catch(Exception e){
				System.out.println("problemas com o servidor: "+e);
			}
		}

	}

