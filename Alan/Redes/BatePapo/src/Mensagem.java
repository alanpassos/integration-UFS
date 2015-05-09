import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.*;
import java.util.ArrayList;

public class Mensagem {

	private Socket socket;
	private ArrayList<PrintStream> clientes;

	public Mensagem(Socket socket, ArrayList<PrintStream> clientes) {

		this.socket = socket;
		this.clientes = clientes;

		Thread();

	}

	private void Thread() {

		Thread thread = new Thread(new Runnable() {

			@Override
			public void run() {

				String mensagem = "";
				try {
					InputStreamReader inputStreamRead = new InputStreamReader(
							socket.getInputStream());
					BufferedReader buffereRead = new BufferedReader(
							inputStreamRead);

					while ((mensagem = buffereRead.readLine()) != null) {

						enviarMensagem(mensagem);

					}

				} catch (IOException e) {

					e.printStackTrace();
				}

			}
		});
		thread.start();

	}

	private void enviarMensagem(String mensagem) {

		for (PrintStream cliente : clientes) {

			cliente.println(socket.getInetAddress()+ ": "+   mensagem);
			cliente.flush();

		}

	}
}
