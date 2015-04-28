class Graph
   {
   private final int MAX_VERTS = 20;
   private Vertex vertexList[]; 
   private CelulaAdjacencia matrizAdjacencia[][];   
   private int numeroVerts;
   private Queue theQueue;
   private int posicaoFinal;
   private int posicaoInicial;
// ------------------------------------------------------------
   public Graph()   
      {
      vertexList = new Vertex[MAX_VERTS];
                                       
      matrizAdjacencia = new CelulaAdjacencia[MAX_VERTS][MAX_VERTS];
      numeroVerts = 0;
      for(int y=0; y<MAX_VERTS; y++)   
         for(int x=0; x<MAX_VERTS; x++)  
            matrizAdjacencia[x][y] = new CelulaAdjacencia(0, 0);
      
      theQueue = new Queue();
      
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
	  matrizAdjacencia[destino][inicio].edge = 1;
	  matrizAdjacencia[inicio][destino].custo = custo;
	  matrizAdjacencia[destino][inicio].custo = custo;
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
      int v2;
      int v1 = 0; 

      while((v1 != posicaoFinal) && !theQueue.isEmpty() )    
         {
    	 theQueue.ordenaLista();
    	 theQueue.exibeLista();
    	 //System.out.println("---"+theQueue.remove());
         v1 = theQueue.remove();
        

         while( (v2=getAdjUnvisitedVertex(v1)) != -1  )
            {                      
        	displayVertex(v2);
        	System.out.println();
        	
            vertexList[v2].wasVisited = true;  
            vertexList[v2].pai = v1; 
            
            //System.out.println(matrizAdjacencia[v1][v2].custo);
            theQueue.insert(v2);              
            theQueue.setSomaCusto(theQueue.getSomaCusto(v1)+matrizAdjacencia[v1][v2].custo, true, v2);
            }   
         }  

      this.posicaoFinal = v1;
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
 		System.out.println("Caminho:");
 		int[] caminhoInverso = new int[numeroVerts];
 		int j = this.posicaoFinal;
 		int indiceArray = 0;
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

