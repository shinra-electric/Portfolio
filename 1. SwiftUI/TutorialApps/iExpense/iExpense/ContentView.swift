//
//  ContentView.swift
//  iExpense
//
//  Created by シェイミ on 28/10/2020.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    // Xcode 12 marks this id with a warning, saying it cannot be decoded because it's a constant.
    // However we don't want the ID to change, so it's better not to set it as a variable.
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}


class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try?
                encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
        
    }
    
    
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text("€\(item.amount)")
                    }
                }
            .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                }
                )
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: self.expenses)
            }
                }
        }
    
    func removeItems(at offsets: IndexSet) {
           expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
