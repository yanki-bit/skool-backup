/**
 * 
 */
package lab2;

/**
 * Programmer: Aiyanna Tiangco
 * Class: INFO 2313
 * Section: S11
 * 
 * This program simulates a simple banking app
 */

import java.util.Scanner; // import this to get user input 

public class TestBankAccount {

	/**
	 * @param args
	 */
	
	public static void main(String[] args) {
		//This is the null bank account object
		BankAccount Test = new BankAccount();
		Test.display();
		
		//Create user input object with Scanner called "uNameInput" for the Account Name
		Scanner uNameInput = new Scanner(System.in);
		System.out.println("Enter your name: "); //user prompt to let them know what to input
		String userName = uNameInput.nextLine(); //stores user name in local variable userName
		
		BankAccount Test2 = new BankAccount(userName, 1000.50);
		//Test2.display();
		
		//withdraw and deposit amount
		System.out.println("Account balance after withdrawal: $" + Test2.withdraw(100));
		System.out.println("Account balance after deposit: $" + Test2.deposit(100));
		System.out.println("");
		
		Test2.display2();
		
		//System.out.println("Below is the toString Test");
		//Test2.toString();
		System.out.println(Test2.toString());
		
		
	}

}
