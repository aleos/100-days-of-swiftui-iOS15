//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Alexander Ostrovsky on 21.08.2022.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
