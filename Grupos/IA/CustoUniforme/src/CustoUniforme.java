import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Stack;


public class CustoUniforme {

	public void largura(Vertice inicial){
		Comparator<Vertice> custoComparator = new CustoComparator();
		PriorityQueue<Vertice> filaVertice = new PriorityQueue<Vertice>(10, custoComparator);
		filaVertice.add(inicial);
		inicial.setVisitado(true);

		while (!filaVertice.isEmpty()) {
			Vertice atual = filaVertice.poll();

			System.out.println("Raiz " + atual.getLabel());
			for (Aresta aresta : atual.getAresta()) {
				if (!aresta.getDestino().isVisitado()) {
					Vertice expandido = aresta.getDestino();
					expandido.setVisitado(true);
					expandido.setPai(atual);
					filaVertice.add(expandido);
				}
			}
		}

	}
	
	public void profundidade(Vertice inicial){
		Stack<Vertice> pilhaVertice = new Stack<Vertice>();
		pilhaVertice.push(inicial);
		inicial.setVisitado(true);
		int[] indice = new int[20];
		while ( !pilhaVertice.isEmpty() ){
			Vertice atual = pilhaVertice.peek();
			if(indice[atual.getIndice()] >= atual.getAresta().size()){
				indice[atual.getIndice()] = 0;
				pilhaVertice.pop();
			}
			else{
				if(!atual.getAresta().get(indice[atual.getIndice()]).getDestino().isVisitado()){
					atual.getAresta().get(indice[atual.getIndice()]).getDestino().setVisitado(true);
					atual.getAresta().get(indice[atual.getIndice()]).getDestino().setPai(pilhaVertice.peek());
					pilhaVertice.push(atual.getAresta().get(indice[atual.getIndice()]).getDestino());
				}
				indice[atual.getIndice()]++;
			}
	
		}
	}
	
	public void custoUniforme(Vertice inicial){
		Comparator<Vertice> custoComparator = new CustoComparator();
		PriorityQueue<Vertice> filaVertice = new PriorityQueue<Vertice>(10, custoComparator);
		filaVertice.add(inicial);
		
		while(!filaVertice.isEmpty()){
			Vertice atual = filaVertice.poll();
			atual.setExpandido(true);
			System.out.println("Raiz "+atual.getLabel());
			for(Aresta aresta : atual.getAresta()){
				Vertice expandido = aresta.getDestino();
				
				if(!expandido.isExpandido()){
					System.out.println("Expandido "+expandido.getLabel());
					int custo = aresta.getCusto();
					int custoTotal = atual.getCustoMinimo() + custo;
					if((custoTotal < expandido.getCustoMinimo()) || (expandido.getCustoMinimo() == 0)){
						expandido.setCustoMinimo(custoTotal);
						expandido.setPai(atual);
						filaVertice.add(expandido);			
					}
				}
			}
		}
	}
	
	public void AStar(Vertice inicial, Vertice finalVertice){
		Comparator<Vertice> funcaoFComparator = new FuncaoFComparator();
		PriorityQueue<Vertice> filaVertice = new PriorityQueue<Vertice>(10, funcaoFComparator);
		filaVertice.add(inicial);
		Vertice atual = null;
		while(!filaVertice.isEmpty() ){
			atual = filaVertice.poll();
			if(atual == finalVertice)
				return;
			atual.setExpandido(true);
			System.out.println("Raiz "+atual.getLabel());
			for(Aresta aresta : atual.getAresta()){
				Vertice expandido = aresta.getDestino();
				
				if(!expandido.isExpandido()){
					System.out.println("Expandido "+expandido.getLabel());
					int custo = aresta.getCusto();
					int custoTotal = atual.getCustoMinimo() + custo;
					int funcaoFLocal = custoTotal + expandido.getHeuristica();
					if((funcaoFLocal < expandido.getFuncaoF()) || (expandido.getFuncaoF() == 0)){
						expandido.setCustoMinimo(custoTotal);
						expandido.setFuncaoF(funcaoFLocal);
						expandido.setPai(atual);
						filaVertice.add(expandido);			
					}
				}
			}
		}
	}
	
	public void Guloso(Vertice inicial, Vertice finalVertice){	
		Vertice atual = inicial;
		while(atual != finalVertice ){
			int heuristicaMenor = atual.getAresta(0).getDestino().getHeuristica();
			Vertice noMelhor = null;
			for(Aresta aresta : atual.getAresta()){
				if(heuristicaMenor >= aresta.getDestino().getHeuristica()){
					heuristicaMenor = aresta.getDestino().getHeuristica();
					noMelhor = aresta.getDestino();
				}
			}
			noMelhor.setPai(atual);
			atual = noMelhor;
		}
	
	}
	
	public void hillClimbing(Vertice inicial, Vertice finalVertice){
		Vertice atual = inicial;
		while(inicial != finalVertice){
			int heuristicaMenor = atual.getAresta(0).getDestino().getHeuristica();
			Vertice noMelhor = null;
			System.out.println(atual.getLabel());	
			for(Aresta aresta : atual.getAresta()){
				if(heuristicaMenor >= aresta.getDestino().getHeuristica()){
					heuristicaMenor = aresta.getDestino().getHeuristica();
					noMelhor = aresta.getDestino();
				}
			}
			if(noMelhor.getHeuristica() > atual.getHeuristica()){
				return;
			}
			atual = noMelhor;
		}
		
	}
	
	public ArrayList<Vertice> geraCaminho(Vertice verticeFinal){
		ArrayList<Vertice> caminho = new ArrayList<Vertice>();
		while(verticeFinal != null){
			caminho.add(verticeFinal);
			verticeFinal = verticeFinal.getPai();
		}
		Collections.reverse(caminho);
		return caminho;
	}
	
	public static void main(String[] args){
		CustoUniforme c = new CustoUniforme();
		Vertice v0 = new Vertice('A');
		Vertice v1 = new Vertice('Z');
		Vertice v2 = new Vertice('T');
		Vertice v3 = new Vertice('S');
		Vertice v4 = new Vertice('O');
		Vertice v5 = new Vertice('R');
		Vertice v6 = new Vertice('D');
		Vertice v7 = new Vertice('L');
		Vertice v8 = new Vertice('M');
		Vertice v9 = new Vertice('C');
		Vertice v10 = new Vertice('F');
		Vertice v11 = new Vertice('P');
		Vertice v12 = new Vertice('B');
		Vertice v13 = new Vertice('G');
		Vertice v14 = new Vertice('N');
		Vertice v15 = new Vertice('I');
		Vertice v16 = new Vertice('V');
		Vertice v17 = new Vertice('U');
		Vertice v18 = new Vertice('H');
		Vertice v19 = new Vertice('E');
		
		v0.setHeuristica(366);
		v1.setHeuristica(374);
		v2.setHeuristica(329);
		v3.setHeuristica(253);
		v4.setHeuristica(380); 
		v5.setHeuristica(193);
		v6.setHeuristica(242);
		v7.setHeuristica(244);
		v8.setHeuristica(241);
		v9.setHeuristica(160);
		v10.setHeuristica(176);
		v11.setHeuristica(100);
		v12.setHeuristica(0);
		v13.setHeuristica(77);
		v14.setHeuristica(234);
		v15.setHeuristica(226);
		v16.setHeuristica(199);
		v17.setHeuristica(80);
		v18.setHeuristica(151);
		v19.setHeuristica(161);

		v0.setIndice(0);
		v1.setIndice(1);
		v2.setIndice(2);
		v3.setIndice(3);
		v4.setIndice(4); 
		v5.setIndice(5);
		v6.setIndice(6);
		v7.setIndice(7);
		v8.setIndice(8);
		v9.setIndice(9);
		v10.setIndice(10);
		v11.setIndice(11);
		v12.setIndice(12);
		v13.setIndice(13);
		v14.setIndice(14);
		v15.setIndice(15);
		v16.setIndice(16);
		v17.setIndice(17);
		v18.setIndice(18);
		v19.setIndice(19);
		
		v0.setAresta(new Aresta(v2, 118));
		v0.setAresta( new Aresta(v3, 140));
		v0.setAresta(new Aresta(v1, 75));
		v1.setAresta(new Aresta(v4, 71));
		v4.setAresta(new Aresta(v3, 151));
		v3.setAresta( new Aresta(v10, 99));
		v3.setAresta( new Aresta(v5, 80));
		v2.setAresta( new Aresta(v7, 111));
		v7.setAresta( new Aresta(v8, 70));
		v8.setAresta( new Aresta(v6, 75));
		v6.setAresta(new Aresta(v9, 120));
		v9.setAresta(new Aresta(v5, 146));
		v9.setAresta( new Aresta(v11, 138));
		v5.setAresta( new Aresta(v11, 97));
		v10.setAresta(new Aresta(v12, 211));
		v11.setAresta( new Aresta(v12, 101));
		v12.setAresta( new Aresta(v13, 90));
		v12.setAresta( new Aresta(v17, 85));
		v17.setAresta( new Aresta(v16, 142));
		v17.setAresta( new Aresta(v18, 98));
		v16.setAresta( new Aresta(v15, 92));
		v15.setAresta( new Aresta(v14, 87));
		v18.setAresta( new Aresta(v19, 86));

		//c.custoUniforme(v0);
		//c.AStar(v0, v12);
		//c.hillClimbing(v0, v12);
		//c.Guloso(v0, v12);
		//c.largura(v0);
		c.profundidade(v0);
		for (Vertice vertice : c.geraCaminho(v12)) {
			System.out.print(vertice.getLabel());
		}
	}
	
}
