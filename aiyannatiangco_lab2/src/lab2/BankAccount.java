/**
 * 
 */
package lab2;

/**
 * importing important packages below
 */

import java.util.Scanner; // import this to get user input 
import java.util.Random; //imported for the random id number generation 


public class BankAccount {
	
	Random id_gen = new Random(); // new object for random id generation
	
	
	//Method to get the user chosen account number
	public int getAccNum() {
		//Create user input object with Scanner called "uinput" for the Account Type
		Scanner uinput = new Scanner(System.in);
		
		//user prompt to let them know what to input
		System.out.println("Enter Type of account: 1-Chequing, 2-Savings, 3-TFSA");
					
		//Integer variable called numValue stores user inputed number
		int numValue = uinput.nextInt();
		
			
		return numValue;
	}
	
	
	
	//fields for accounts
	String name;
	int ID = id_gen.nextInt(1000); 
	int accountType = getAccNum();
	double initialDeposit;
	
	//trying another global variable
	double currentBalance;
	
	//constants
	private double INTEREST_SAVINGS_YEARLY= 2.1; //yearly interest percentage
	private double INTEREST_TFSA_YEARLY= 2.3; //TFSA Yearly  percentage
	
	//generate an empty constructor
	public BankAccount () {
		
	}
	
	
	//generate a constructor w/ 2 parameters
	public BankAccount(String name, double initialDeposit) {
		this.name = name;
		this.ID = ID;
		this.accountType = accountType;
		this.initialDeposit = initialDeposit;
	}

	
public void setId_gen(Random id_gen) {
		this.id_gen = id_gen;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


	public int getAccountType() {
		return accountType;
	}


	//generate getters and setters for the constructors 
	public Random getId_gen() {
		return id_gen;
	}


	public void setAccountType(int accountType) {
		this.accountType = accountType;
	}


	public double getInitialDeposit() {
		return initialDeposit;
	}


	public void setInitialDeposit(double initialDeposit) {
		this.initialDeposit = initialDeposit;
	}
	
	//Method for checking
	public void display() {
		
		System.out.println("Bank Account Details: "+ "\n" + "Name: " + name + "\n"+
		                   "id: " + ID + "\n"+ "Account Type: " + accountType + "\n" + 
		                   "Deposit: " + initialDeposit);
		System.out.println("Yearly Interest: " + Yearly_Interest() +"%"); 
		System.out.println(""); //add some space
	}
	
    public void display2() {
		
		System.out.println("Bank Account Details: "+ "\n" + "Name: " + name + "\n"+
		                   "id: " + ID + "\n"+ "Account Type: " + accountType + "\n" + 
		                   "Money: " + initialDeposit);
		System.out.println("Yearly Interest: " + Yearly_Interest() +"%"); 
		System.out.println(""); //add some space
	}
	
	public double withdraw(double amount) {
		
		/* turned scanner off since it created more bugs
		 * //Create user input object with Scanner called "withdrawInput" for the withdrawal amount
		
		Scanner withdrawInput = new Scanner(System.in);
				
		//user prompt to let them know what to input
		System.out.println("Enter amount to withdraw: ");
		double withdrawValue = withdrawInput.nextDouble(); //Integer variable called numValue stores user inputed number
				
		*/
		
		//save old Balance into current Balance variable
		currentBalance = initialDeposit;
		System.out.println("This is the initial deposit: $" + currentBalance);
		
		//overwrite initialDeposit and return
		return initialDeposit = initialDeposit - amount; 
	}
	
	public double deposit(double depAmount) {
		/*
		//Create user input object with Scanner for the deposit amount
		Scanner depositInput = new Scanner(System.in);
						
		//user prompt to let them know what to input
		System.out.println("Enter amount to deposit: ");
				
		//Integer variable called numValue stores user inputed number
		double depositValue = depositInput.nextDouble();
		*/
		
		//overwrite initialDeposit and return
		return initialDeposit = initialDeposit + depAmount; 
	}
	
	
	//Checking the yearly interest
	public double Yearly_Interest() {
		if (accountType == 1) {
			return 0; //there is no interest for the chequing account
		} else if (accountType == 2) {
			return INTEREST_SAVINGS_YEARLY;
		} else {
			return INTEREST_TFSA_YEARLY;
		}
		
	}
	
	//Checking the yearly interest
	/**
	 * Simple yearly interest is P * R * T
	 * current bal x (r / 100) x 1
	 * 
	 */
		public double Yearly_Interest2() {
			if (accountType == 1) {
				System.out.println("Yearly interest is 0%");
				return 0; //there is no interest for the chequing account
			} else if (accountType == 2) {
				System.out.println("Yearly interest is " + INTEREST_SAVINGS_YEARLY + "%" );
				return initialDeposit * (INTEREST_SAVINGS_YEARLY/100) * 1;
			} else {
				System.out.println("Yearly interest is " + INTEREST_TFSA_YEARLY + "%" );
				return initialDeposit * (INTEREST_TFSA_YEARLY/100) * 1;
			}
			
		}


	@Override
	public String toString() {
		return "Bank Account Details \nname = " + name + "\n" + "ID = " + ID + "\n" + "Account Type = " + accountType + "\n" 
				+ "Account Balance = $"
	
				+ initialDeposit + "\n" + "Interest earned: $" + Yearly_Interest2() ;
	}
	
	//String.format(%1.2f, yourDouble)
	//To String Method (should work same as the display method)
	/*@Override
	public String toString() 
		
		return "Bank Account Details: ["
				+ "Name: " + name + "\n"+
                "id: " + ID + "\n"+ "Account Type: " + accountType + "\n" + 
                "Inital Deposit Amount: " + initialDeposit 
                
                + "]";
	}
	*/
	
	
 
}
