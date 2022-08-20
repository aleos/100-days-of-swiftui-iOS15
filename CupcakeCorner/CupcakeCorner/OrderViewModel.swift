//
//  OrderViewModel.swift
//  CupcakeCorner
//
//  Created by Alexander Ostrovsky on 20.08.2022.
//

import Foundation

class OrderViewModel: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var order = Order()
}
