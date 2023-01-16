//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Sander Haug on 15/01/2023.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        //Takes a file with a name, returns a dictionary String with Astronauts
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            //Finds the file wherever it may be in the bundle location
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            //Tries to load the data into a Data object.
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
            //Create a JSON decoder
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            //Load decoded Data
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
       
    }
}
