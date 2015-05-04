public class Bissexto {
	public static void main(String[] args) {
bisexto(2012);
	}

	private static void bisexto(int data) {

		if (data % 4 == 0) {
			if(data % 100 == 0){
				
				if(data % 400 ==0){
					
					System.out.println("ano bissexto");
				}else{
					System.out.println("não é bissexto");
				}
				
			}else{
				System.out.println("ano bissexto");
			}
			
			
		}else{
			System.out.println("não é bissexto");
		}

	}

}
