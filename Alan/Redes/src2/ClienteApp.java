import java.awt.Desktop;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.util.Scanner;

public class ClienteApp {
	static String _ip = null;

	public static void main(String[] args) {
		Scanner ler = new Scanner(System.in);
		_ip = "127.0.0.1";
		int count = 0;
		try {
			Socket cli;

			System.out.println("INFORME A MENSAGEM");
			String mensagem = ler.nextLine();
			// ESTANCIANDO O SOCKET
			while (true) {
				System.out.println("continuar?");
				String fim = ler.nextLine();

				count++;
				if (count == 1) {
					new ServidorRaiz();
				} else if (count == 2) {
					new ServidorDominioTopo();
				} else if (count == 3) {
					new ServidorAutoritativo();
				}

				cli = new Socket(_ip, 9090);
				System.out
						.println("\n######################   CLIENTE   ###############################\n");

				System.out.println("ENVIANDO MENSAGEM PARA O SERVIDOR \n");
				// ENVIANDO PARA O SERVIDOR
				
				DataOutputStream outCli = new DataOutputStream(
						cli.getOutputStream());
				outCli.writeUTF(mensagem);

				// RECEBENDO DO CERVIDOR
				DataInputStream inpServidor;
				inpServidor = new DataInputStream(cli.getInputStream());
				mensagem = inpServidor.readUTF();
				String ip = inpServidor.readUTF();
				System.out
						.println("\n######################   CLIENTE   ###############################\n");
				System.out.println("RECEBENDOS MENSAGEM DO \n SERVIDOR: {"
						+ cli.getInetAddress() + "} \n MENSAGEM (: " + mensagem
						+ ") \n IP: [" + ip + "]");
				_ip = ip;
				if (count == 3) {
					System.out.println("EXECUTANDO FIREFOX");
					try {
						Desktop.getDesktop().browse(new URI("http://"+mensagem));
					} catch (URISyntaxException e) {
						// TODO Auto-generated catch block
						System.out.println(e);
						e.printStackTrace();
					}
					//Runtime.getRuntime().exec(("firefox "+mensagem));
				}
				cli.close();
				outCli.close();
			}
		} catch (IOException e) {
			System.out.println("Erro No Cliente: " + e);

		}

	}

	public static String ReceberMensagem(Socket cli) {

		DataInputStream inpServidor;
		try {
			inpServidor = new DataInputStream(cli.getInputStream());
			String mensagem = inpServidor.readUTF();
			System.out.println("Mensagem recebido do cliente: {"
					+ cli.getInetAddress() + "}: " + mensagem);
			return mensagem;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	private static void EnviarDados(Scanner ler, Socket cli, String mensagem)
			throws IOException {
		// ENVIDANDO DADOS PARA O SERVIDOR
		DataOutputStream outCli = new DataOutputStream(cli.getOutputStream());
		outCli.writeUTF(mensagem);
		outCli.close();
	}

}
