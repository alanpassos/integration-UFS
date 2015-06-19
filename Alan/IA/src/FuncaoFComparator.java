import java.util.Comparator;


public class FuncaoFComparator implements Comparator<Vertice>{

	public int compare(Vertice vertice1, Vertice vertice2) {
		if(vertice1.getFuncaoF() < vertice2.getFuncaoF()){
			return -1;
		}
		if(vertice1.getFuncaoF() > vertice2.getFuncaoF()){
			return 1;
		}
		return 0;
	}

}
