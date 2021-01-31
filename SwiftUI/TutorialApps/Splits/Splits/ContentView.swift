//
//  ContentView.swift
//  Splits
//
//  Created by シェイミ on 21/08/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2

    
    
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(billAmount) ?? 0
        
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        
        
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $billAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 60) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("€\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Do The Splits")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




