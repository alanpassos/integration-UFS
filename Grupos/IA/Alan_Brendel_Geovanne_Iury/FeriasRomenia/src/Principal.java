
public class Principal {
	Graph theGraph = new Graph();
	
	public Principal(){
		adicionaVertex();
		adicionaEdge();
	}
	
	public void adicionaVertex()
	{
		theGraph.addVertex('O');//0
		theGraph.addVertex('Z');//1
		theGraph.addVertex('A');//2
		theGraph.addVertex('T');//3
		theGraph.addVertex('L');//4
		theGraph.addVertex('M');//5
		theGraph.addVertex('D');//6
		theGraph.addVertex('S');//7
		theGraph.addVertex('R');//8
		theGraph.addVertex('C');//9
		theGraph.addVertex('F');//10
		theGraph.addVertex('P');//11
		theGraph.addVertex('B');//12
		theGraph.addVertex('G');//13
		theGraph.addVertex('N');//14
		theGraph.addVertex('I');//15
		theGraph.addVertex('V');//16
		theGraph.addVertex('U');//17
		theGraph.addVertex('H');//18
		theGraph.addVertex('E');//19
	}
	
	public void adicionaEdge()
	{
		theGraph.addEdge(0, 1, 71);
		theGraph.addEdge(0, 7, 51);
		
		theGraph.addEdge(2, 1, 75);
		theGraph.addEdge(2, 7, 140);
		theGraph.addEdge(2, 3, 118);
		
		theGraph.addEdge(3, 4, 111);
		
		theGraph.addEdge(4, 5, 70);
		
		theGraph.addEdge(5, 6, 75);
		
		theGraph.addEdge(6, 9, 120);
		
		theGraph.addEdge(7, 8, 80);
		theGraph.addEdge(7, 10, 99);
		
		theGraph.addEdge(8, 9, 146);
		theGraph.addEdge(8, 11, 97);
		
		theGraph.addEdge(11, 9, 138);
		theGraph.addEdge(11, 12, 101);
		
		theGraph.addEdge(10, 12, 211);
		
		theGraph.addEdge(12, 13, 90);
		theGraph.addEdge(12, 17, 85);
		
		theGraph.addEdge(17, 16, 142);
		theGraph.addEdge(17, 18, 98);
		
		theGraph.addEdge(16, 15, 92);
		
		theGraph.addEdge(15, 14, 87);
		
		theGraph.addEdge(18, 19, 86);
	}
	
	public static void main(String []args){
		Principal principal = new Principal();
		principal.theGraph.setInicioFim('A', 'B');
		principal.theGraph.custoUniforme();
		principal.theGraph.geraCaminho();
	}
}
