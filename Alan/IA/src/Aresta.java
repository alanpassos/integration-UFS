
public class Aresta {

	private Vertice destino;
	private int custo;
	
	public Aresta(Vertice destino, int custo) {
		this.destino = destino;
		this.custo = custo;
	}
	
	public Vertice getDestino() {
		return destino;
	}
	public void setDestino(Vertice destino) {
		this.destino = destino;
	}
	public int getCusto() {
		return custo;
	}
	public void setCusto(int custo) {
		this.custo = custo;
	}
	
	
	
}
