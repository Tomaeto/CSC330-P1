
import java.util.Scanner;
public class goldbach {

	public static void main(String[] args) {
	int val;
	boolean meetsReqs;
	Scanner in = new Scanner(System.in);
	System.out.print("Enter an odd integer greater than seven: ");
	val = in.nextInt();
	meetsReqs = checkReqs(val);
	
}
	//Checks if a value satisfies the requirements for Goldbach's weak conjecture (odd int > 7)
	public static boolean checkReqs(int n) { 

		if(n % 2 == 1 && n > 7)
		{ 
			return true;
		}
		else
			return false;
}

	
}
