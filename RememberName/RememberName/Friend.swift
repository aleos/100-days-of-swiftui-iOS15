//
//  Friend.swift
//  RememberName
//
//  Created by Alexander Ostrovsky on 15.09.2022.
//

import Foundation
import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    var photo: UIImage
    var name: String
}
