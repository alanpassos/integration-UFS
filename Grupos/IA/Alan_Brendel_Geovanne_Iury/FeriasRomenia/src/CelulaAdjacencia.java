
public class CelulaAdjacencia {
	int edge;
	int custo;
	private int somaCusto;
	
	public CelulaAdjacencia(int edge, int custo) {
		this.edge = edge;
		this.custo = custo;
	}	
	
	public int getSomaCusto() {
		return somaCusto;
	}
	public void setSomaCusto(int somaCusto) {
		this.somaCusto = somaCusto;
	}
	public void setSomaCusto(int somaCusto, boolean soma) {
		this.somaCusto = getSomaCusto() + somaCusto;
	}
}
