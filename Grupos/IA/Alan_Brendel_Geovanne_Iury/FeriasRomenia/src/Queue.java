import java.util.Arrays;

class Queue
{
private final int SIZE = 120;
private CelulaAdjacencia[] queArray;
private int front;
private int rear;

//-------------------------------------------------------------
public Queue()            // constructor
   {
   queArray = new CelulaAdjacencia[SIZE];
   for (int i = 0; i < SIZE; i++) {
	   queArray[i] = new CelulaAdjacencia(0, 0);
   }
   front = 0;
   rear = -1;
   }
//-------------------------------------------------------------
public void insert(int j) // put item at rear of queue
   {
   if(rear == SIZE-1)
      rear = -1;
   queArray[++rear].edge = j;
   }
//-------------------------------------------------------------
public int remove()       // take item from front of queue
   {
   int temp = queArray[front++].edge;
   System.out.println("front "+front);
   if(front == SIZE)
      front = 0;
   return temp;
   }
//-------------------------------------------------------------
public boolean isEmpty()  // true if queue is empty
   {
   return ( rear+1==front || (front+SIZE-1==rear) );
   }
//-------------------------------------------------------------
public void ordenaLista(){
	quick(front, rear);
}
public void setSomaCusto(int somaCusto){
	queArray[front].setSomaCusto(somaCusto);
}
public int getSomaCusto(int indice) {
	return queArray[buscaIndice(indice)].getSomaCusto();
}
public void quick(int inicio, int fim) {

	int i, j, x, aux;
	i = inicio;
	j = fim;
	x = queArray[(i+j)/2].getSomaCusto();

	do {
		while (queArray[i].getSomaCusto() < x)
			i++;
		while (queArray[j].getSomaCusto() > x)
			j--;

		if (i <= j) {
			aux = queArray[i].getSomaCusto();
			queArray[i].setSomaCusto(queArray[j].getSomaCusto());
			queArray[j].setSomaCusto(aux);
			i++;
			j--;
		}

	} while (i <= j);
	if (inicio < j)
		quick(inicio, j);
	if (i < fim)
		quick(i, fim);
}
public void setSomaCusto(int somaCusto, boolean b, int indice) {
	queArray[buscaIndice(indice)].setSomaCusto(somaCusto, b);
	
}

public void exibeLista(){
	System.out.println("Lista:");
	for (int i = 0; i < SIZE; i++) {
		System.out.print(queArray[i].getSomaCusto()+"	");
	}
	System.out.println();
}

public int buscaIndice(int indice){
	for (int i = 0; i < SIZE; i++) {
		if(indice == queArray[i].edge)
			return i;
	}
	return -1;
}

}  // end class Queue