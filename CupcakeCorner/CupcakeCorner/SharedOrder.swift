//
//  SharedOrder.swift
//  CupcakeCorner
//
//  Created by Alexander Ostrovsky on 20.08.2022.
//

import Foundation

class SharedOrder: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var data = Order()
}
