package xianmo;
/* The purpose of this program is to implement an example of a self-organising search function.
 *
 * Each time an item is found, it is moved to the first position in the array, and all other items are shifted to the right.
 *
 * TEST: print the contents of the array each time a search is performed to see the changes made.
 * The array should print horizontally.
 *
 */
public class SelfOrganisingSearch {
    private final int[] array;
    /**
     *
     */
    public SelfOrganisingSearch() {
        // Create an int array of length 10, and populate with random numbers between 1 and 10.
        array = new int[10];
        for (int i = 0; i < array.length; i++) {
            array[i] = (int) (Math.random() * 10 + 1);
        }
    }//Constructor

    //METHODS

    public static int selfOrgSearch(int[] arr, int valueToBeFound) {
        int i = 0;
        while ((i < arr.length) && (arr[i] != valueToBeFound)) {// while we are searching the length of the array and
            // not found what we are looking for;
            // Once we find the value, the while loop breaks.
            i++; // keep looking
        } // end while
        if (i == arr.length) // Once we hit the end of the array
            return -1; // we haven't found it, return -1
        else if (i != 0) {  //As long as the value is not at the top of the list, we will:
            int temp1 = arr[i]; //Keep the value to move to the top in a temp
            for (int j = i - 1; j >= 0; j--) { //A for loop starting at i and going down to 0
                int temp2 = arr[j]; //Copy values to the right
                arr[j] = arr[j + 1];
                arr[j + 1] = temp2;
            }//end for loop
            arr[0] = temp1;	//put the value to the top.
        }
        return i;// Return the location array[i], so we know where we found it

    }// search()


    public void printArray(int[] array) {
        for (int e : array) {
            System.out.print(e + " ");
        }
        System.out.println();
    }// printArray


    public static void main(String[] args) {
        // Set up two arrays to test

        //Array 1
        SelfOrganisingSearch a1 = new SelfOrganisingSearch();

        System.out.print("Contents for Array1 are: ");
        a1.printArray(a1.array);

        int toSearch = (int) ((Math.random() * 10 + 1)); //Create a number between 1 and 10 to search for
        System.out.println("Value to search for: " + toSearch);
        int result = selfOrgSearch(a1.array, toSearch);

        if (result == -1) {//If the number was not found in the array
            System.out.println(toSearch + " was not found in the array");
            System.out.print("The array has not been altered: ");
        }else {//If the number was found in the array
            System.out.println(toSearch + " was found at: Array1[" + result + "].");
            System.out.println("Moving the result to the top of the array...");
            System.out.print("Contents for Array1 after the search are: ");
        }
        a1.printArray(a1.array);

        System.out.println("\n------------------------------------------------------------");

        SelfOrganisingSearch a2 = new SelfOrganisingSearch();

        System.out.print("Contents for Array2 are: ");
        a2.printArray(a2.array);

        int toSearch2 = (int) ((Math.random() * 10 + 1));//Create a number between 1 and 10 to search for
        System.out.println("Value to search for: " + toSearch2);
        int result2 = selfOrgSearch(a2.array, toSearch2);

        if (result2 == -1) {//If the number was not found in the array
            System.out.println(toSearch2 + " was not found in the array");
            System.out.print("The array has not been altered: ");
            a2.printArray(a2.array);
        }else {//If the number was found in the array
            System.out.println(toSearch2 + " was found at: Array2[" + result2 + "].");
            System.out.println("Moving the result to the top of the array...");
            System.out.print("Contents for Array1 after the search are: ");
            a2.printArray(a2.array);
        }




    }//Main method

}
