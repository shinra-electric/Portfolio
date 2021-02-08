/* The purpose of this program is to implement binary search.
 *
 * Array must be sorted.
 *
 */
package xianmo;

public class BinarySearch {
    private final int[] array;

    public BinarySearch() {
        // Create an int array of length 10, and populate with random numbers between 1 and 10.
        array = new int[10];
        for (int i = 0; i < array.length; i++) {
            array[i] = (int) (Math.random() * 10 + 1);
        }
    }//Constructor


    //selectionSort() method will sort the array from smallest to largest.
    public static void selectionSort(int[] list) {
        for (int i = 0; i < list.length - 1; i++) {//Perform the below loop on all indexes starting with [0]
            // Use a for loop to find the minimum in the list.
            int currentMin = list[i]; //current minimum is the first value
            int currentMinIndex = i; //current minimum index

            for (int j = i + 1; j < list.length; j++) {
                if (currentMin > list[j]) {
                    currentMin = list[j];
                    currentMinIndex = j;
                }//end if
            }//Second for loop

            if (currentMinIndex != i) {
                list[currentMinIndex] = list[i];
                list[i] = currentMin;
            }//end if
        }// First for loop
    }//selectionSort()


    public static int binarysearch(int[] arr, int valueToBeFound) {
        //initialise start, end, and midpoint variables
        int start = 0;
        int end = arr.length - 1;
        int mid = (start + end) /2;

        while ((start <= end) && (arr[mid] != valueToBeFound)) {
            // while we are searching between the start and end and have
            // not found what we are looking for;
            // Once we find the value, the while loop breaks.
            if (valueToBeFound < arr[mid]) {
                end = mid - 1;
            } else {
                start = mid + 1;
            }//end if
            mid = (start + end) /2;
        } // end while

        int loc;
        if (arr[mid] == valueToBeFound)  {
            loc = mid;
        }else {
            loc = -1;
        }
        return loc;

    }// search()


    public void printArray(int[] array) {
        for (int e : array) {
            System.out.print(e + " ");
        }
        System.out.println();
    }// printArray



    public static void main(String[] args) {
        //-----Test Array 1-----
        //Create new array from constructor
        BinarySearch a1 = new BinarySearch();

        //Display contents of array
        System.out.print("Initial contents for Array1 are: ");
        a1.printArray(a1.array);

        //Sort the array
        System.out.println("Sorting array....");
        selectionSort(a1.array);
        //Reprint after sorting
        System.out.print("Contents of Array1 after sorting: ");
        a1.printArray(a1.array);

        //Pick a number to search for
        int toSearch = (int) ((Math.random() * 10 + 1));
        System.out.println("Value to search for: " + toSearch);

        //perform the search
        int result = binarysearch(a1.array, toSearch);

        //display the results
        if (result == -1)
            System.out.println(toSearch + " was not found in the array");
        else
            System.out.println(toSearch + " was found at: Array1[" + result + "].");



        System.out.println("\n-----------------------------------------------------------");

        //-----Test Array 2-----
        //Create new array from constructor
        BinarySearch a2 = new BinarySearch();

        //Display contents of array
        System.out.print("Initial contents for Array2 are: ");
        a2.printArray(a2.array);

        //Sort the array
        System.out.println("Sorting array....");
        selectionSort(a2.array);
        //Reprint after sorting
        System.out.print("Contents of Array2 after sorting: ");
        a2.printArray(a2.array);

        //Pick a number to search for
        int toSearch2 = (int) ((Math.random() * 10 + 1));
        System.out.println("Value to search for: " + toSearch2);

        //perform the search
        int result2 = binarysearch(a2.array, toSearch2);

        //display the results
        if (result2 == -1)
            System.out.println(toSearch2 + " was not found in the array");
        else
            System.out.println(toSearch2 + " was found at: Array2[" + result2 + "].");



    }//Main Method

}
