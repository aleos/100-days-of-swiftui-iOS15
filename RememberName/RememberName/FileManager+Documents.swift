//
//  FileManager+Documents.swift
//  RememberName
//
//  Created by Alexander Ostrovsky on 15.09.2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
