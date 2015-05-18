import java.util.Comparator;


public class CustoComparator implements Comparator<Vertice>{

	@Override
	public int compare(Vertice vertice1, Vertice vertice2) {
		if(vertice1.getCustoMinimo() < vertice2.getCustoMinimo()){
			return -1;
		}
		if(vertice1.getCustoMinimo() > vertice2.getCustoMinimo()){
			return 1;
		}
		return 0;
	}

}
