package xianmo;

public class Quicksort {

    private int[] tempArray;
    private int tempLength;

    public static void main(String[] args) {

        Quicksort sort = new Quicksort();

        // Create array
        int[] myList = new int[10];

        for (int i = 0; i < myList.length; i++) {
            myList[i] = (int) (Math.random() * 100);
        }

        System.out.println("\nRandom unsorted Array:");
        printArray(myList);


        System.out.println("\n\nDoing sorting magic...");
        sort.sort(myList);


        System.out.println("\nSorted Array:");
        printArray(myList);
        System.out.println();

        System.exit(0);
    }// Main Method


    public void sort(int[] array) {
        if ((array == null) || (array.length == 0)) {
            return;
        }
        this.tempArray = array;
        this.tempLength = array.length;
        quickSort(0, (tempLength - 1));

    }// sort()

    private void quickSort(int low, int high) {

        // Make left < pivot and right > pivot
        int i = low;
        int j = high;

        // Select the pivot value
        int middle = low+(high-low)/2;
        int pivot = tempArray[middle];

        //
        while (i <= j) {

            while (tempArray[j] > pivot) {
                j--;
            }
            while (tempArray[i] < pivot) {
                i++;
            }
            if (i <= j) {
                int temp = tempArray[i];
                tempArray[i] = tempArray[j];
                tempArray[j] = temp;
                i++;
                j--;
            }

        } // while

        // recursively sort two sub-arrays
        if (low < j)
            quickSort(low, j);
        if (i < high)
            quickSort(i, high);

    }// quickSort()

    public static void printArray(int[] array) {
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i] + " ");
        }
    }// printArray()

}// Class
