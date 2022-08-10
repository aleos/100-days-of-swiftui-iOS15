//
//  Expenses.swift
//  iExpense
//
//  Created by Alexander Ostrovsky on 10.08.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
