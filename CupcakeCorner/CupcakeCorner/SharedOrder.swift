//
//  SharedOrder.swift
//  CupcakeCorner
//
//  Created by Alexander Ostrovsky on 20.08.2022.
//

import Foundation

@dynamicMemberLookup
class SharedOrder: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    @Published var data = Order()

    subscript<T>(dynamicMember keyPath: KeyPath<Order, T>) -> T {
        data[keyPath: keyPath]
    }

    subscript<T>(dynamicMember keyPath: WritableKeyPath<Order, T>) -> T {
        get {
            data[keyPath: keyPath]
        }

        set {
            data[keyPath: keyPath] = newValue
        }
    }
}
