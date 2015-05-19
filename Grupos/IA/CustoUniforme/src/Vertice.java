import java.util.ArrayList;


public class Vertice {

	private char label;
	private Vertice pai;
	private int custoMinimo;
	private int heuristica;
	private int funcaoF;
	private boolean expandido;
	private boolean visitado;
	
	private ArrayList<Aresta> aresta;
	private int indice;
	
	public Vertice(char label) {
		this.indice = 0;
		this.label = label;
		this.heuristica = 0;
		this.funcaoF = 0;
		this.pai = null;
		this.custoMinimo = 0;
		this.expandido = false;
		this.visitado = false;
		this.aresta = new ArrayList<Aresta>();
	}

	public int getFuncaoF() {
		return funcaoF;
	}

	public void setFuncaoF(int funcaoF) {
		this.funcaoF = funcaoF;
	}

	public char getLabel() {
		return label;
	}

	public void setLabel(char label) {
		this.label = label;
	}

	public Vertice getPai() {
		return pai;
	}

	public void setPai(Vertice pai) {
		this.pai = pai;
	}

	public int getCustoMinimo() {
		return custoMinimo;
	}

	public void setCustoMinimo(int custoMinimo) {
		this.custoMinimo = custoMinimo;
	}

	public boolean isExpandido() {
		return expandido;
	}

	public void setExpandido(boolean expandido) {
		this.expandido = expandido;
	}
	
	public Aresta getAresta(int indice){
		return this.aresta.get(indice);
	}
	
	public ArrayList<Aresta> getAresta(){
		return this.aresta;
	}
	
	public void setAresta(Aresta aresta){
		this.aresta.add(aresta);
	}
	
	public int getHeuristica() {
		return heuristica;
	}

	public void setHeuristica(int heuristica) {
		this.heuristica = heuristica;
	}
	public boolean isVisitado() {
		return visitado;
	}

	public void setVisitado(boolean visitado) {
		this.visitado = visitado;
	}
	
	public int getIndice() {
		return indice;
	}

	public void setIndice(int indice) {
		this.indice = indice;
	}


}
