//
//  main.swift
//  Quicksort
//
//  Created by シェイミ on 01/02/2021.
//

import Foundation

private var tempArray = [Int]()
private var tempLength: Int = 0

// Use map to create an array with 10 random numbers from 1 to 99
var numberArray = (1...10).map{ _ in Int.random(in: 1...99) }

// Print the array with spaces
print("\nDemonstration of Quicksort.\n")
print("Here is an array with 10 random numbers from between 1 and 99:")
numberArray.forEach { print($0, terminator: " ") }

print("\n\nDoing sorting magic...\n")
sort(array: numberArray)
numberArray = tempArray

print("The sorted array is: ")
numberArray.forEach { print($0, terminator: " ") }
print("\n\n\n\n")




func sort(array: [Int]) {
    tempArray = array
    tempLength = array.count
    
    quickSort(low: 0, high: Int((tempLength - 1)))
    
}

func quickSort(low: Int, high: Int) {
    
    // make left < pivot and right > pivot
    var i: Int = low
    var j: Int = high
    
    // Select the pivot value
    let middle = low + (high - low) / 2
    let pivot: Int = tempArray[middle]
    
    //While loop
    
    while (i <= j) {
        
        while tempArray[j] > pivot {
            j -= 1
        }
        
        while (tempArray[i] < pivot) {
            i += 1
        }
        
        if (i <= j) {
            let temp = tempArray[i]
            tempArray[i] = tempArray[j]
            tempArray[j] = temp
            i += 1
            j -= 1
        }
 
    } // End of while loop
    
    // Recursively sort two sub-arrays
    if (low < j) {
        quickSort(low: low, high: j)
    }
    if (i < high) {
        quickSort(low: i, high: high)
    }
}
