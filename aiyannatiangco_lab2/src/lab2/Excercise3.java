/**
 * 
 */
package lab2;

/**
 * 
 */
public class Excercise3 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//table title
		System.out.println("Population Per Continent (in millions)");
			
		// initialize array sample
		// call array population
		
		String [][] cPopulation = {
			{"Year", "1750"},
			{"Africa", "106"},
			{"Asia", "502"},
			{"Australia", "2"},
		};
		
		int arrayIndex;
		int arrayColumn;
		int colSum = 0; //will hold the running total per column 
		
		for (arrayColumn=0; arrayColumn < 4; arrayColumn++) {
			for(arrayIndex=0; arrayIndex < 2; arrayIndex++) {
				System.out.print(cPopulation[arrayColumn][arrayIndex] + "\t");
			}
			System.out.println("summation of col" + arrayColumn);
			System.out.println("");
		}
		
		System.out.println("");
		System.out.println("");
		System.out.println("Testing 2 arrays");
		String [] outlierYear = {
				"Year2", 
				"1750",
				"1800", 
				"1850",
				"1900",	
				
		};
		
		String [] outlierCountry = {
				"Year",
				"Africa",
				"Asia", 
				"Australia",
				"Europe",
				"North America",
				"South America"
				
		};
		
		int[][] cPopulation2 = {
			   //0  1  2
				{1750, 1800, 1850, 1900, 1950, 2000, 2050},
				{106,   107,  111,  133,  221,  767, 1766},
				{502,   635,  809,   },
				{2,       2, 5},
				{163,   203, 5},
				{2,       7, 5},
				{16,     24, 5},
			};
			
			int colSum2 = 0; //will hold the running total per column 
			
			for (arrayColumn=0; arrayColumn < 4; arrayColumn++) {
				
				
				System.out.println("");
				//print left column for year and countries
				System.out.print(outlierCountry[arrayColumn] + "\t");
				
				//int column = 1;
				int row = 2;
				for(arrayIndex=0; arrayIndex < 3; arrayIndex++) {
					
					System.out.print(cPopulation2[arrayColumn][arrayIndex] + "\t");
					
				}
				
				//trying to exclude years in the summary
				if(cPopulation2[arrayColumn][row] < 1000) {
					colSum2 += cPopulation2[arrayColumn][row];
				}
				//colSum2 += cPopulation2[arrayColumn][row];
				//i++;
				System.out.println("summation at loop" + arrayColumn + " = " + colSum2);
				System.out.println("");
			}

		//sum of the array for population
		// col 0
			for (int i = 1; i <= 6; i++) {
				
				colSum += cPopulation2[i][0];
				
				System.out.println("loop " + i + " is " + colSum );
				
			}
			System.out.println("Total for year 1750 is: " + colSum );
			System.out.println("");
			
			
			// col 1
			int sum = 0;
				for (int i = 1; i < 4; i++) {
						
					sum += cPopulation2[i][1];
						
					System.out.println("loop " + i + " is " + sum );
							
				}
			System.out.println("");
				
				
			// col 2
			int sum2 = 0;
			for (int i = 1; i < 4; i++) {
							
				sum2 += cPopulation2[i][2];
							
				System.out.println("loop " + i + " is " + sum2);
								
			}			

	}//end of main 

}
