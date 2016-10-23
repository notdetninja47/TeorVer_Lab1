//
//  main.swift
//  TeorVer_Lab1
//
//  Created by Daniel on 20.10.16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import Foundation

let location = "/Users/daniel/Desktop/input.txt"
let content = Helpers.readFile(fromPath: location)!
let data = Helpers.retrieveData(fromDataString: content)

let sample = Statistics(withData:data)

print("Mean: \(sample.mean!)")
print("Dispersion: \(sample.dispersion!)")
print("Deviation: \(sample.deviation!)")
print("Median: \(sample.median!)")
print("Mode: \(sample.mode!)")
print("Maximum: \(sample.maximum!)")
print("Minimum: \(sample.minimum!)")
print("Range: \(sample.range!)")

print("Percentile 0.1: \(sample.getCustomPercentile(withPercent: 0.1)!)")
print("Percentile 0.25: \(sample.getCustomPercentile(withPercent: 0.25)!)")
print("Percentile 0.5: \(sample.getCustomPercentile(withPercent: 0.5)!)")
print("Percentile 0.75: \(sample.getCustomPercentile(withPercent: 0.75)!)")
