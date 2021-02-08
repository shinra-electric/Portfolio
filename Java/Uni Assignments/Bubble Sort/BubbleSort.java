package xianmo;

public class BubbleSort {
    private final int[] theArray = new int[10];
    private final int arraySize = 10;

    public BubbleSort() {
        // TODO Auto-generated constructor stub
    }


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

    public void bubbleSort() {//Use nested for loops.
        for (int i = 0; i <= theArray.length - 2; i++)
            for (int j = 0; j <= theArray.length - i - 2; j++) //Start at [0] and go up to length - 2 - i (no need to go further).
                if (theArray[j] > theArray[j + 1]) { //Check if the LHS is greater than the RHS. If so, swap.
                    int temp = theArray[j]; //Swap
                    theArray[j] = theArray[j + 1];
                    theArray[j + 1] = temp;
                }//end if
    }//bubbleSort()





    //Main Method
    public static void main(String[] args) {
        BubbleSort newArray = new BubbleSort();

        System.out.println("Generating an array[10] with random values between 10 and 20.....");
        newArray.generateRandomArray();

        System.out.println("Array before bubble sorting:");
        newArray.printHorzArray(-1, -1);

        newArray.bubbleSort();

        System.out.println("Array after bubble sorting:");
        newArray.printHorzArray(-1, -1);




    }




}