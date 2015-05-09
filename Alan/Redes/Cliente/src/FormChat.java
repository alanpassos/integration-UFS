import java.awt.Event;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.InetAddress;
import java.net.Socket;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class FormChat extends JFrame {
	// awt
	JPanel _panelPrincipal = new JPanel();
	JPanel _panelSecundario = new JPanel();
	JButton _enviar = new JButton("Enviar");
	TextArea _visaoChat = new TextArea();
	TextArea _chat = new TextArea();
	Label _informacao = new Label("inform");

	// conexões
	private Socket _chatSocket;
	private String _mensagem;
	private BufferedReader bufferedRead;
	private InputStreamReader inputStreamRead;

	PrintStream _printStream;
	String _ip = null;

	public FormChat() {

		_ip = JOptionPane.showInputDialog(null, "informe o IP");

		if (_ip == null) {

			System.exit(0);
		}
		try {
			_chatSocket = new Socket(_ip, 6890);

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Erro ao se conectar: " + e);

		}

		adicionando_componentes();
		acoes();

		Thread();

		// TODO Auto-generated constructor stub
	}

	Thread thread;

	private void Thread() {

		thread = new Thread(new Runnable() {
			String mensagem = null;

			@Override
			public void run() {

				try {
					inputStreamRead = new InputStreamReader(
							_chatSocket.getInputStream());
					bufferedRead = new BufferedReader(inputStreamRead);
					;
					int count = 0;
					while ((mensagem = bufferedRead.readLine())!= null) {

						System.out.println(mensagem);
						_visaoChat.setText("\n" 
								+ mensagem+ _visaoChat.getText());
						

					}

				} catch (IOException e) {

					e.printStackTrace();
				}

			}
		});
		thread.start();

	}

	// enviando mensagem ao servidor
	private void PrintStream() {
		pegarValor();
		try {
			_printStream = new PrintStream(_chatSocket.getOutputStream());
			_printStream.println(_mensagem);
			if(_mensagem.equalsIgnoreCase("clrear"))
				_visaoChat.setText("");
			_mensagem = null;
			_printStream.flush();
			
			

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// CLASSES PARA AWT
	private void pegarValor() {

		_mensagem = null;
		_mensagem = _chat.getText();
		_chat.setText(null);

		/*
		 * _visaoChat.setText("\n" + _chatSocket.getInetAddress() + ": " +
		 * _mensagem + _visaoChat.getText());
		 */
	}

	private void acoes() {

		_enviar.setMnemonic(KeyEvent.VK_ENTER);

		_enviar.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				PrintStream();
			}
		});

		_chat.addKeyListener(new KeyListener() {

			@Override
			public void keyTyped(KeyEvent e) {
				if (e.getKeyChar() == KeyEvent.VK_ENTER) {

					PrintStream();
				}

			}

			@Override
			public void keyReleased(KeyEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void keyPressed(KeyEvent e) {
				// TODO Auto-generated method stub

			}
		});

	}

	private void adicionando_componentes() {
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		_enviar.setBounds(10, 10, 10, 10);
		_visaoChat.setEditable(false);
		_panelPrincipal.setLayout(new GridLayout(2, 1, 5, 10));
		_panelSecundario.setLayout(new GridLayout(1, 3, 5, 10));
		_panelPrincipal.add(_visaoChat);

		_panelPrincipal.add(_panelSecundario);
		_panelSecundario.add(_chat);
		_panelSecundario.add(_enviar);

		add(_panelPrincipal);

		this.setBounds(200, 200, 400, 500);

	}

	public static void main(String[] args) {
		new FormChat().setVisible(true);
	}

}
