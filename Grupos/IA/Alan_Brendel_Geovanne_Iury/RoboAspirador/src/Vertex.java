
class Vertex
   {
   public char label;
	boolean salaEsquerda;
	boolean salaDireita;
   public boolean wasVisited;

   public Vertex(char lab, boolean salaEsquerda, boolean salaDireita) 
      {
      label = lab;
      this.salaDireita = salaDireita;
      this.salaEsquerda = salaEsquerda;
      wasVisited = false;
      }
   } 
