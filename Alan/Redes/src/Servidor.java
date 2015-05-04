import java.io.*;
import java.net.*;

public class Servidor {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {

		ServerSocket welcomeSocket = new ServerSocket(6789);
		while (true) {
			Socket connectionSocket = welcomeSocket.accept();
			Conexao c = new Conexao(connectionSocket);
			c.start();
		}

	}

}
