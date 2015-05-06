import java.io.*;
import java.net.*;
import java.util.Scanner;


public class Cliente {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws UnknownHostException 
	 */
	public static void main(String[] args) {
		String nmArquivo;
		BufferedReader inFromUser =
		new BufferedReader(new InputStreamReader(System.in));
		try{
		Socket clientSocket = new Socket("127.0.0.1", 6789);
		DataOutputStream outToServer =
		new DataOutputStream(clientSocket.getOutputStream());
				nmArquivo = inFromUser.readLine();
				outToServer.writeBytes(nmArquivo + '\n');


/*				Scanner s = new Scanner(clientSocket.getInputStream());
				FileOutputStream f = new FileOutputStream(nmArquivo);
				while(s.hasNext())
				{
					byte b = s.nextByte();
					f.w
				}
	*/			
				DataInputStream in = new DataInputStream(clientSocket.getInputStream());  
                String mensagem = in.readUTF(); 
                
                System.out.println(mensagem);
                
				BufferedInputStream inputS = new BufferedInputStream(clientSocket.getInputStream());
				byte[] buffer = new byte[2048];    //If you handle larger data use a bigger buffer size
				int read;
				FileOutputStream fw = new FileOutputStream("Cliente_"+nmArquivo);
				System.out.println("Aguardando dados do arquivo");
				int count = 0;
				 
				while((read = inputS.read(buffer)) != -1) {
				    fw.write(buffer, 0, read);
					
				    System.out.println("Recebendo do servidor: "+ count++);
				    System.out.println("Recebendo do servidor: "+ new String(buffer));  
				   
					
				}
				fw.close();
				System.out.println("Arquivo fechado");				
				clientSocket.close();

				
				
				
				
				
				
				
				
/*				BufferedReader inFromServer =
						new BufferedReader(new
						InputStreamReader(clientSocket.getInputStream()));
				String arquivo;
				FileWriter fw = new FileWriter("Cliente_"+nmArquivo);
				System.out.println("Aguardando dados do arquivo");
				while ((arquivo = inFromServer.readLine()) != null)
				{
					fw.write(arquivo+ '\r'+'\n');
					System.out.println("Recebendo do servidor: "+ arquivo);
				}
				fw.close();
				System.out.println("Arquivo fechado");				
				clientSocket.close();
				*/
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}

	}

}
