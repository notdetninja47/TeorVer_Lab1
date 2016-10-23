//
//  Helpers.swift
//  TeorVer_Lab1
//
//  Created by Daniel on 20.10.16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import Cocoa
import Foundation

class Helpers{
    static func readFile(fromPath path: String) -> String? {
        do {
            let fileContent = try String(contentsOfFile: location)
            return fileContent
        }catch{
            print("error when reading file")
            return nil
        }
    }
    static func retrieveData(fromDataString dataString: String) -> [Double] {
        let stringValues = dataString.components(separatedBy: .newlines)
        var result: [Double] = []
        for value in stringValues {
            if value.isEmpty {
                continue
            }
            result.append(Double(value)!)
        }
        return result
    }
    
}
