import java.util.Scanner;


public class RoboAspirador {

	Graph theGraph = new Graph();
	
	public void adicionaVertex()
	{
		theGraph.addVertex('A', true, true, 'E');
		theGraph.addVertex('B', true, true, 'D');
		theGraph.addVertex('C', false, true, 'E');
		theGraph.addVertex('D', false, true, 'D');
		theGraph.addVertex('E', true, false, 'E');
		theGraph.addVertex('F', true, false, 'D');
		theGraph.addVertex('G', false, false, 'E');
		theGraph.addVertex('H', false, false, 'D');
	}
	
	public void adicionaEdge()
	{
		theGraph.addEdge(0, 0);
		theGraph.addEdge(0, 1);
		theGraph.addEdge(0, 2);
		
		theGraph.addEdge(1, 0);
		theGraph.addEdge(1, 1);
		theGraph.addEdge(1, 5);
		
		theGraph.addEdge(2, 2);
		theGraph.addEdge(2, 3);
		
		theGraph.addEdge(3, 2);
		theGraph.addEdge(3, 3);
		theGraph.addEdge(3, 7);
		
		theGraph.addEdge(4, 4);
		theGraph.addEdge(4, 5);
		theGraph.addEdge(4, 6);
		
		theGraph.addEdge(5, 5);
		theGraph.addEdge(5, 4);
		
		theGraph.addEdge(6, 6);
		theGraph.addEdge(6, 7);
		
		theGraph.addEdge(7, 6);
		theGraph.addEdge(7, 7);

	}
	
	public static void main(String[] args) 
	{
		
		Scanner lerNome = new Scanner(System.in);
		RoboAspirador roboAspirador = new RoboAspirador();
		roboAspirador.adicionaVertex();
		roboAspirador.adicionaEdge();
		roboAspirador.theGraph.displayTodosVertex();
		System.out.println("\nPor Favor, Informe o Estado Inicial:");
		char estadoInicial = lerNome.next().toUpperCase().charAt(0);
		
		roboAspirador.theGraph.setInicioFim(estadoInicial);
		roboAspirador.theGraph.bfs();
		roboAspirador.theGraph.geraCaminho();
		
		System.out.println("Estado Final: As Duas Salas Limpas");
		
	}

}
