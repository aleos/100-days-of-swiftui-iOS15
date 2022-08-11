//
//  ContentView.swift
//  iExpense
//
//  Created by Alexander Ostrovsky on 09.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.types, id: \.self) { type in
                    Section {
                        ForEach(expenses.items.filter { $0.type == type }) { item in
                            ExpenseRow(item: item)
                        }
                        .onDelete {
                            removeItems(at: $0, type: type)
                        }
                    } header: {
                        Text(type)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    func removeItems(at offsets: IndexSet, type: String) {
        let itemsOfType = expenses.items.filter { type == $0.type }
        let idsToRemove = offsets.map { itemsOfType[$0].id }
        expenses.items = expenses.items.filter { !idsToRemove.contains($0.id) }
    }
    
    private struct ExpenseRow: View {
        let item: ExpenseItem
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }
                
                Spacer()
                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .foregroundColor(item.amount < 10 ? .primary : item.amount < 100 ? .orange : .red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
