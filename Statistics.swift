//
//  Statistics.swift
//  TeorVer_Lab1
//
//  Created by Daniel on 20.10.16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import Cocoa
import Darwin

class Statistics {
    var data: [Double] = []
    
    init(withData data: [Double]) {
        self.data = data;
    }
    
    var mean: Double?{
        if data.isEmpty {
            return nil
        }
        var result = 0.0
        for item in data {
            result += item
        }
        return result/Double(data.count)
    }
    
    var dispersion: Double? {
        if data.isEmpty {
            return nil
        }
        let dataMean = mean!
        var result = 0.0
        for item in data {
            result += pow(item - dataMean, 2.0)
        }
        result /= Double(data.count-1)
        return result
    }
    
    var deviation: Double? {
        if data.isEmpty {
            return nil
        }
        return sqrt(dispersion!)
    }
    
    var median: Double? {
        if data.isEmpty {
            return nil
        }
        let buffer = data.sorted()
        let middle = buffer.count/2
        
        if buffer.count%2 != 0 {
            return buffer[middle]
        }
        return (buffer[middle-1]+buffer[middle])/2
    }
    
    var mode: [Double]? {
        if data.isEmpty {
            return nil
        }
        let descendingFrequency = frequency.sorted {$0.1 > $1.1}
        let maximumCount = descendingFrequency.first!.value
        var result:[Double] = []
        for (key, value) in descendingFrequency {
            if(value == maximumCount){
                result.append(key)
            }
        }
        return result.sorted()
    }
    var frequency:[Double:Int]{
        var result: [Double:Int] = [:]
        for item in data {
            if result.keys.contains(item) {
                result[item]! += 1;
            } else {
                result[item] = 1;
            }
        }
        return result
    }
    
    var maximum: Double?{
        return data.max()
    }
    
    var minimum: Double?{
        return data.min()
    }
    
    var range: Double?{
        if data.isEmpty {
            return nil
        }
        return maximum! - minimum!
    }
    
    func getCustomPercentile(withPercent percent:Double) -> Double? {
        if data.isEmpty {
            return nil
        }
        let ascendingData = data.sorted {$0 < $1}
        let index = Int(floor(Double(data.count)*percent))
        return ascendingData[index - 1]
    }
}
