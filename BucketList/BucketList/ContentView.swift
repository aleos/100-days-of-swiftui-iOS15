//
//  ContentView.swift
//  BucketList
//
//  Created by Alexander Ostrovsky on 01.09.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Text("Hello World")
            .onTapGesture {
                let str = "Test Message"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

extension FileManager {
    func decode<T: Decodable>(_ file: String) -> T {
        let url = getDocumentsDirectory().appendingPathExtension(file)
        guard FileManager.default.fileExists(atPath: url.absoluteString) else {
            fatalError("Failed to locate file \(file).")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from file.")
        }

        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from file.")
        }

        return loaded
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
