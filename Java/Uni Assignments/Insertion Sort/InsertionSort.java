package xianmo;

public class InsertionSort {
    private final int[] theArray = new int[10];
    private final int arraySize = 10;


    public InsertionSort() {
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


    //Insertion Sort method

    public void insertionSort() {

        for (int j = 1; j <= theArray.length -1; j++) {//Start at [1], no need to to compare [0] with itself.
            int temp = theArray[j]; //store the compared value in a temp
            int i = j - 1; //i is the first value we want to compare, it's on the LHS of J
            while ((i >= 0) && (theArray[i] > temp))  { //Use a while because we don't know how many iterations there will be
                theArray[i + 1] = theArray[i];
                i = i -1;
            }//while
            theArray[i + 1] = temp;
        }//for

    }// insertionSort()



    //Main Method
    public static void main(String[] args) {
        InsertionSort newArray = new InsertionSort();

        System.out.println("Generating an array[10] with random values between 10 and 20.....");
        newArray.generateRandomArray();

        System.out.println("Array before insertion sorting:");
        newArray.printHorzArray(-1, -1);

        newArray.insertionSort();

        System.out.println("Array after insertion sorting:");
        newArray.printHorzArray(-1, -1);




    }

}

