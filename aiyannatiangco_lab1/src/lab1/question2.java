/**
 * 
 */
package lab1;

import java.util.Scanner; //allows user input 
/**
 * 
 */
public class question2 {

	/**
	 * Programmer: Aiyanna Tiangco
	 * Class: INFO 2313
	 * Section: S11
	 * 
	 * This program will use the fibonacci formula depending on 
	 * the number the user enters. 
	 */
	public static void main(String[] args) {
		
		//First two are hard-coded values
		int first = 0;
		int second = 1;
		int sum = first + second; 
		
		//Create user input object with Scanner called "scan"
		Scanner scan = new Scanner(System.in);
		//user prompt to let them know what to input
		System.out.println("Please input a number: ");
						
		//Integer variable called run Value stores user inputed number
		// this is the variable for max number of times a number will appear
		int runValue = scan.nextInt();
		System.out.println("You inputted: " + runValue );
		System.out.println("Please input a number: ");
		
		int num = 0;
		int num2 = 1;
		 
		//count is how many times to run loop
		for (int count = 0; count < runValue; count++) 
		{
			/**
			num += num;
			System.out.println("total " + num );
			num++;
			System.out.println("increment " + num );
			 */
			
			int total;
			total = num + num2;
			System.out.println("n1 " + num );
			System.out.println("n2 " + num2 );
			System.out.println("current total: " + total );
			
			num2 = num;
			num = total;
			
			
			
		}

	}

}
