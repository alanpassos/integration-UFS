import java.awt.DisplayMode;
import java.io.*;
import java.net.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class Conexao extends Thread {
	private Socket s;
private int count;
	public Conexao(Socket s) {
		this.s = s;
		count = 0;
	}

	public void run() {
		try {
			BufferedReader inFromClient = new BufferedReader(
					new InputStreamReader(this.s.getInputStream()));
			// Aguarda nome do arquivo enviado pelo cliente.
			try {
				System.out.println("Setando timout servidor");
				s.setSoTimeout(20000);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				s.close();
				e.printStackTrace();
				return;
			}
			String nmArquivo = inFromClient.readLine();
			try {
				System.out.println("Recebeu pedido de arquivo " + nmArquivo);
				
			} catch (Exception e) {
				System.out.println("nome invalido");
			}

			try {
				// Verifica se o arquivo existe e caso exista envia para o
				// cliente
				
				byte[] arquivo = lerbytes(nmArquivo);
				DataOutputStream outToClient = new DataOutputStream(
						s.getOutputStream());
				  
	             outToClient.writeUTF("Estamos Analizando sua Solicitação"); 
				
	             
	             System.out.println(new String(arquivo));
	             
	             //System.out.println("quantidade de leituras no arquivo: "+ count++);
				outToClient.write(arquivo);
				System.out.println("Enviou arquivo para "
						+ s.getInetAddress().toString());
				outToClient.close();
			} catch (Exception e) {

				
				System.out.println("o arquivo requerido não existe");
				visualizarArquivos("src");

			}

			/*
			 * // Verifica se o arquivo existe e caso exista envia para o
			 * cliente String arquivo = ler(nmArquivo); DataOutputStream
			 * outToClient = new DataOutputStream( s.getOutputStream());
			 * System.out.println(arquivo); outToClient.writeBytes(arquivo);
			 * System.out.println("Enviou arquivo"); outToClient.close();
			 */

		} catch (IOException ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		}

	}

	public String ler(String nomeArq) throws FileNotFoundException {
		System.out.println("Lendo do diretorio do servidor");
		//String teste = ler(nomeArq);
		// System.out.println(new String(teste));
		String texto = "";
		try {
			File file = new File(nomeArq);
			Scanner sc = new Scanner(file);

			while (sc.hasNextLine()) {
				texto += sc.nextLine() + "\n";
			}
			sc.close();
		} catch (Exception e) {

		}
		 
		return texto;
	}

	public  void visualizarArquivos(String diretorio) throws IOException {

		File file = new File(diretorio);
		File afile[] = file.listFiles();
		DataOutputStream outToClient= new DataOutputStream(
				s.getOutputStream());
		  
         //outToClient.writeUTF("Estamos Analizando sua Solicitação"); 
		//System.out.println(new String(arquivo));
		
		
		int i = 0;
		for (int j = afile.length; i < j; i++) {
			File arquivos = afile[i];
			
			 outToClient.writeUTF(arquivos.getName());
			 System.out.println(arquivos.getName());
			 
		}
		outToClient.close();
	}

	public byte[] lerbytes(String nomeArq) throws IOException {
		System.out.println("Lendo do diretorio do servidor");
		Path path = Paths.get("", new String[] { nomeArq });
		return Files.readAllBytes(path);

	}

}