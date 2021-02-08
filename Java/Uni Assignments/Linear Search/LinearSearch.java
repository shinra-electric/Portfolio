package xianmo;

/*This program is to implement a linear search function for an array.
 * It contains:
 *
 * - Public Method toString() which will create a string showing the private member data of the class
 * - Public Method search() which accepts a variable "valueToBeFound as a parameter.
 * 			It will search the integer array for the value and return either the location or -1.
 * 			- Option: call the toString method to show how the private member data if the class is being updated.
 * - Public Main Method which:
 * 		i) creates an object of the class
 * 		ii) Searches for a value in the array
 * 		iii) Prints out the changes made to the objects.
 *
 *
 *
 */


public class LinearSearch {
    private final int[] array;

    public LinearSearch() {
        // Create an int array of length 10.
        array = new int[10];
        // populate with random numbers between 1 and 10 using a for loop.
        for (int i = 0; i < array.length; i++) {
            array[i] = (int) (Math.random() * 10 + 1);
        }
    }// Constructor

    // METHODS
    public static int linearSearch(int[] arr, int valueToBeFound) {
        int i = 0;
        while ((i < arr.length) && (arr[i] != valueToBeFound)) {// while we are searching the length of the array and
            // not found what we are looking for;
            // Once we find the value, the while loop breaks.
            i++; // keep looking
        } // end while
        if (i == arr.length) // Once we hit the end of the array
            return -1; // we haven't found it, return -1
        else
            return i;// we found it at location array[i]

    }// search()

    public void printArray(int[] array) {
        for (int e : array) {
            System.out.print(e + " ");
        }
        System.out.println();
    }// printArray

    public static void main(String[] args) {
        // create two arrays to test the search


        //Array1
        LinearSearch a1 = new LinearSearch();

        System.out.print("Contents for Array1 are: ");
        a1.printArray(a1.array);

        int toSearch = (int) ((Math.random() * 10 + 1));//create a random value between 1 and 10 to search for
        System.out.println("Value to search for: " + toSearch);
        int result = linearSearch(a1.array, toSearch); //perform the search

        if (result == -1)
            System.out.println(toSearch + " was not found in the array"); //if not found
        else
            System.out.println(toSearch + " was found at: Array1[" + result + "]."); //if found

        //Array 2
        System.out.println("\n-----------------------------------------------------------");
        LinearSearch a2 = new LinearSearch();

        System.out.print("Contents for Array2 are: ");
        a2.printArray(a2.array);

        int toSearch2 = (int) ((Math.random() * 10 + 1));//create a random value between 1 and 10 to search for
        System.out.println("Value to search for: " + toSearch2);
        int result2 = linearSearch(a2.array, toSearch2); //perform the search

        if (result2 == -1)
            System.out.println(toSearch2 + " was not found in the array");//if not found
        else
            System.out.println(toSearch2 + " was found at: Array1[" + result2 + "].");//if found

    }

}