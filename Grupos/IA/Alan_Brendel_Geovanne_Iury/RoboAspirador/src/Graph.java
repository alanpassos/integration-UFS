class Graph
   {
   private final int MAX_VERTS = 8;
   private Vertex vertexList[]; 
   private int matrizAdjacencia[][];   
   private int numeroVerts;
   private Queue theQueue;
   private int posicaoFinal;
   private int posicaoInicial;
// ------------------------------------------------------------
   public Graph()   
      {
      vertexList = new Vertex[MAX_VERTS];
                                       
      matrizAdjacencia = new int[MAX_VERTS][MAX_VERTS];
      numeroVerts = 0;
      for(int y=0; y<MAX_VERTS; y++)   
         for(int x=0; x<MAX_VERTS; x++)  
            matrizAdjacencia[x][y] = 0;
      
      theQueue = new Queue();
      
      } 
// ------------------------------------------------------------
   public void addVertex(char lab, boolean salaEsquerdaSuja, boolean salaDireitaSuja, char posicaoAspirador)
      {
      vertexList[numeroVerts++] = new Vertex(lab, salaEsquerdaSuja, salaDireitaSuja, posicaoAspirador);
      }
// ------------------------------------------------------------
   public void addEdge(int inicio, int destino)
      {
      matrizAdjacencia[inicio][destino] = 1;
      }
// ------------------------------------------------------------
   public void setInicioFim(char posicaoInicial)
   	{    
	   	this.posicaoInicial = searchPos(posicaoInicial);
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
   public void bfs()                   
      {                               
      vertexList[posicaoInicial].wasVisited = true;               
      theQueue.insert(posicaoInicial);              
      int v2;
      int v1 = 0; 

      while((!vertexList[v1].estadoFinal()) && !theQueue.isEmpty() )    
         {
         v1 = theQueue.remove();   

         while( (v2=getAdjUnvisitedVertex(v1)) != -1  )
            {                      
        	
            vertexList[v2].wasVisited = true;  
            vertexList[v2].pai = v1;         
            theQueue.insert(v2);              
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
         if(matrizAdjacencia[v][j]==1 && vertexList[j].wasVisited==false)
            return j;
      return -1;
      } 
// ------------------------------------------------------------
 	public void geraCaminho()
 	{	
 		System.out.println("Caminho:\n");
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

