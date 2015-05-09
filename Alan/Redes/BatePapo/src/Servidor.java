import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.io.PrintStream;

import javax.swing.JButton;
import javax.swing.JFrame;

public class Servidor extends JFrame {
	JButton butao = new JButton("sair");

	public Servidor() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		add(butao);
		butao.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				System.exit(0);
			}
		});
		
		this.setBounds(100, 100, 100, 100);
	}

	public static void main(String[] args) {
new Servidor().setVisible(true);
		ArrayList<PrintStream> clientes = new ArrayList<>();
		try {
			ServerSocket server = new ServerSocket(6890);
			Socket socket;

			while (true) {

				socket = server.accept();
				clientes.add(new PrintStream(socket.getOutputStream()));

				Mensagem mensagem = new Mensagem(socket, clientes);

			}

		} catch (Exception e) {
			System.out.println("erro: " + e);
		}
	}

}
