
class Vertex
   {
	
	public char label;
	char posicaoAspirador;
	boolean salaEsquerdaSuja;
	boolean salaDireitaSuja;
	public boolean wasVisited;
	int pai;

   public Vertex(char lab, boolean salaEsquerdaSuja, boolean salaDireitaSuja, char posicaoAspirador) 
      {
      label = lab;
      this.posicaoAspirador = posicaoAspirador;
      this.salaDireitaSuja = salaDireitaSuja;
      this.salaEsquerdaSuja = salaEsquerdaSuja;
      wasVisited = false;
      pai =  -1 ;
      }
   public boolean estadoFinal()
   {
	   if((!salaDireitaSuja) && (!salaEsquerdaSuja))
	   {
		   return true;
	   }
	   return false;
   }
   
   }
