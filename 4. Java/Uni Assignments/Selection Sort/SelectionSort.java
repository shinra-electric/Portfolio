package xianmo;

public class SelectionSort {
    private final int[] theArray = new int[10];
    private final int arraySize = 10;


    public SelectionSort() {

    }// Constructor


    public void generateRandomArray() {

        for (int i = 0; i < arraySize; i++) {

            theArray[i] = (int) (Math.random() * 10) + 10;

        }

    }//generateRandomArray



    public void printHorzArray(int i, int j) {

        for (int n = 0; n < 51; n++)
            System.out.print("-");// Prints the -------------

        System.out.println();

        for (int n = 0; n < arraySize; n++) {

            System.out.print("| " + n + "  ");

        }//for

        System.out.println("|");

        for (int n = 0; n < 51; n++)
            System.out.print("-");//Prints the -------------

        System.out.println();

        for (int n = 0; n < arraySize; n++) {

            System.out.print("| " + theArray[n] + " ");

        }

        System.out.println("|");

        for (int n = 0; n < 51; n++)
            System.out.print("-");//Prints the -------------

        System.out.println("\n");


    }// printHorzArray

    public void selectionSort(){

        for (int i = 0; i <= theArray.length -2; i++)  {//The outer loop puts the smallest value in [i] and moves to the end.
            int smallest = i;
            for (int j = i + 1; j <= theArray.length - 1; j++) {//This for inner loop finds the smallest value in the array
                if (theArray[j] < theArray[smallest])
                    smallest = j;
                //end if
            }//second for loop
            int temp = theArray[i]; //Perform the swap
            theArray[i] = theArray[smallest];
            theArray[smallest] = temp;
        }//first for loop

    }


    //Main Method

    public static void main(String[] args) {
        SelectionSort newArray = new SelectionSort();

        System.out.println("Generating an array[10] with random values between 10 and 20.....");
        newArray.generateRandomArray();

        System.out.println("Array before selection sorting:");

        newArray.printHorzArray(-1, -1);

        newArray.selectionSort();

        System.out.println("Array after selection sorting:");

        newArray.printHorzArray(-1, -1);



    }

}

