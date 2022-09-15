//
//  Friends.swift
//  RememberName
//
//  Created by Alexander Ostrovsky on 15.09.2022.
//

import Foundation

@MainActor
class Friends: ObservableObject {
    
    @Published private(set) var array: [Friend] = []
    
    init() {
        
    }
}
