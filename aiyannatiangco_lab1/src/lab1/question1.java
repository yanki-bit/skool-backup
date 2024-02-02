/**
 * 
 */
package lab1;

import java.util.Scanner; //allows user input 
/**
 * 
 */


public class question1 {

	/**
	 * Programmer: Aiyanna Tiangco
	 * Class: INFO 2313
	 * Section: S11
	 * 
	 * This program asks user to input an odd number and will output 
	 * a cross made of stars.
	 */
	
	public static void main(String[] args) {
		
		//Create user input object with Scanner called "uinput"
		Scanner uinput = new Scanner(System.in);
		
		//user prompt to let them know what to input
		System.out.println("Please input an odd number: ");
		
		//Integer variable called numValue stores user inputed number
		int numValue = uinput.nextInt();
		
		//check input for easier debugging
		System.out.println("You inputted the number: " + numValue);
		
		//check user input if it is an odd number
		if (numValue % 2 == 0) 
		{
			System.out.println("Error. You inputted an even number.");
			System.out.println("Please restart the program and input an odd number.");
		} else {
			System.out.println("Great! This is an odd number!");
			System.out.println("Now printing a star pattern...");
			
			/**
			 * start of the loops for the star pattern
			 */
			 //uses numValue as the max row count
			
			for (int row = 1; row <= numValue; row++) 
			{
				
				//for (int star = 0; (star <= row && star % 2 == 0) ; star++)  
				for (int star = 1; star <= numValue ; star++)  
				{
					
					if (star == row || star + row == (numValue + 1)) 
					{
						System.out.print(" * ");
					} else if (star != row) {
						System.out.print("   "); //prints space if it doesn't satisfy conditions
					}
				}
				 
				
				
				System.out.println("");
				//System.out.println("End of row loop.");
			}
			
		}

	}

}
