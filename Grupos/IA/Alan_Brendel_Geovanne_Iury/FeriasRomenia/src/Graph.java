import java.util.ArrayList;

class Graph
   {
   private final int MAX_VERTS = 20;
   private Vertex vertexList[]; 
   private CelulaAdjacencia matrizAdjacencia[][]; 
   private ArrayList<Caminho> caminhos; 
   private int numeroVerts;
   private Queue theQueue;
   private int posicaoFinal;
   private int posicaoInicial;
   int indiceCaminho;
// ------------------------------------------------------------
   public Graph()   
      {
      vertexList = new Vertex[MAX_VERTS];
      caminhos = new ArrayList<Caminho>();                               
      matrizAdjacencia = new CelulaAdjacencia[MAX_VERTS][MAX_VERTS];
      numeroVerts = 0;
      for(int y=0; y<MAX_VERTS; y++)   
         for(int x=0; x<MAX_VERTS; x++)  
            matrizAdjacencia[x][y] = new CelulaAdjacencia(0, 0);
      
      theQueue = new Queue();
      indiceCaminho = 0;
      } 
// ------------------------------------------------------------
   public void addVertex(char lab)
      {
      vertexList[numeroVerts++] = new Vertex(lab);
      }
// ------------------------------------------------------------
   public void addEdge(int inicio, int destino, int custo)
      {
	  matrizAdjacencia[inicio][destino].edge = 1;
	  matrizAdjacencia[inicio][destino].custo = custo;
      }
// ------------------------------------------------------------
   public void setInicioFim(char posicaoInicial, char posicaoFinal)
   	{    
	   	this.posicaoInicial = searchPos(posicaoInicial);
	   	this.posicaoFinal = searchPos(posicaoFinal);
	}
// ------------------------------------------------------------
   public int searchPos(char lab)
   	{
	    for (int i=0;i<numeroVerts;i++)
	        if(vertexList[i].label==lab)
	            return i;
	    return -1;
	}
// ------------------------------------------------------------  
   public void displayVertex(int v)
      {
      System.out.print(vertexList[v].label);
      }
// -------------------------------------------------------------
   public void displayTodosVertex()
      {
	  for (int i = 0; i < vertexList.length; i++) {
		
			System.out.print(vertexList[i].label);
		}
      }
// -------------------------------------------------------------
   public void custoUniforme()                   
      {                               
      vertexList[posicaoInicial].wasVisited = true;
      theQueue.setSomaCusto(0, true, 0);
      theQueue.insert(posicaoInicial);              
      int v2 = 0;
      int v1 = 0; 

      while( !theQueue.isEmpty() )    
         {
    	 theQueue.ordenaLista();
         v1 = theQueue.remove();

         while( (v2=getAdjUnvisitedVertex(v1)) != -1  )
            {                      
        	
        	vertexList[v2].wasVisited = true;
        
        	
            vertexList[v2].pai = v1; 
            
            theQueue.insert(v2); 
            int somaTotal = theQueue.getSomaCusto(v1)+matrizAdjacencia[v1][v2].custo;
            theQueue.setSomaCusto(somaTotal, true, v2);
            
			if (v2 == posicaoFinal) {
				caminhos.add(new Caminho(somaTotal, v1));
			}

			}
       
         	vertexList[posicaoFinal].wasVisited = false;
         	         	
         }  


      for(int j=0; j<numeroVerts; j++)            
         vertexList[j].wasVisited = false;
      }  
// ------------------------------------------------------------
   public int getAdjUnvisitedVertex(int v)
      {
      for(int j=0; j<numeroVerts; j++)
         if(matrizAdjacencia[v][j].edge == 1 && vertexList[j].wasVisited==false)
            return j;
      return -1;
      } 
// ------------------------------------------------------------
 	public void geraCaminho()
 	{	
 		int menor = caminhos.get(0).custoCaminho;
 		int pai = caminhos.get(0).pai;
 		for (int i = 0; i < caminhos.size(); i++) {
			if(menor > caminhos.get(i).custoCaminho){
				menor = caminhos.get(i).custoCaminho;
				pai = caminhos.get(i).pai;
			}
		}
 		System.out.println("Caminho:");
 		int[] caminhoInverso = new int[numeroVerts];
 		int j = pai;
 		int indiceArray = 0;
 		caminhoInverso[indiceArray] = posicaoFinal;
 		indiceArray++;
 		caminhoInverso[indiceArray] = j;
 		indiceArray++;
 		while(j != posicaoInicial)
 		{	
 			caminhoInverso[indiceArray] = vertexList[j].pai;
 			j = vertexList[j].pai;
 			indiceArray++;
 		}
 		for (int i = (indiceArray-1); i >= 0; i--) {
			displayVertex(caminhoInverso[i]);
		}
 	}
 //------------------------------------------------------------

   } 

