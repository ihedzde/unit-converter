//
//  ConversionService.swift
//  unit-convertor
//
//  Created by Ivan Hedz on 12.08.2022.
//

import Foundation


struct ConversionService {
    
    init() {
        unitPairs = unitPairs.merging(lengthPairs, uniquingKeysWith: {(first, _) in first})
        unitPairs = unitPairs.merging(volumePairs, uniquingKeysWith: {(first, _) in first})
        unitPairs = unitPairs.merging(temperaturePairs, uniquingKeysWith: {(first, _) in first})
        unitPairs = unitPairs.merging(timePairs, uniquingKeysWith: {(first, _) in first})
    }
    
    var unitPairs: [UnitPair: (Double, Bool)->(Double)] = [:]
    
    func convertUnits(pair: UnitPair, value: Double) -> Double{
        if let convertor = unitPairs[pair]{
            return convertor(value, false)
        }
        else if let convertor = unitPairs[UnitPair(from: pair.outbound, to: pair.inbound)] {
            return convertor(value, true)
        }
        return value
    }
    
    let temperaturePairs = [
        UnitPair(from: Temperature.Fahrenheit.rawValue, to: Temperature.Celsius.rawValue): {(value:Double, reversed:Bool) in ( reversed ? value * 1.8 + 32.0 :(value - 32.0) * 0.5556)},
        UnitPair(from: Temperature.Fahrenheit.rawValue, to: Temperature.Kelvin.rawValue): {(value:Double, reversed:Bool) in ( reversed ? value * 1.8 + 32.0 :(value - 32.0) * 0.5556 + 273.15)},
        
        UnitPair(from: Temperature.Celsius.rawValue, to: Temperature.Kelvin.rawValue): {(value:Double, reversed:Bool) in ( reversed ? (value - 273.15) * 1.8 + 32.0 :(value - 32.0) * 0.5556)},
    ]
    
    let timePairs = [
        UnitPair(from: Time.Day.rawValue, to: Time.Hour.rawValue): {(value:Double, reversed:Bool) in  (reversed ? value / 24 : value * 24)},
        UnitPair(from: Time.Day.rawValue, to: Time.Minute.rawValue): {(value:Double, reversed:Bool) in  (reversed ? value / 1440 : value * 1440)},
        UnitPair(from: Time.Day.rawValue, to: Time.Second.rawValue): {(value:Double, reversed:Bool) in  (reversed ? value / 86400 : value * 86400)},

        UnitPair(from: Time.Hour.rawValue, to: Time.Minute.rawValue): {(value:Double, reversed:Bool) in  (reversed ? value / 60 : value * 60)},
        UnitPair(from: Time.Hour.rawValue, to: Time.Second.rawValue): {(value:Double, reversed:Bool) in  (reversed ? value / 3600 : value * 3600)},
        
        UnitPair(from: Time.Minute.rawValue, to: Time.Second.rawValue): {(value:Double, reversed:Bool) in  (reversed ? value / 60 : value * 60)},
    ]
    
    let lengthPairs = [
        UnitPair(from: Length.Mile.rawValue, to: Length.Kilometers.rawValue): {(value:Double, reversed:Bool) in
            (reversed ? value / 1.60934: value * 1.60934)},
        UnitPair(from: Length.Mile.rawValue, to: Length.Feet.rawValue): {(value:Double, reversed:Bool) in
            (reversed ? value / 5280: value * 5280)},
        UnitPair(from: Length.Mile.rawValue, to: Length.Yard.rawValue): {(value:Double, reversed:Bool) in
            (reversed ? value / 1760: value * 1760)},
        
        UnitPair(from: Length.Kilometers.rawValue, to: Length.Yard.rawValue): {(value:Double, reversed:Bool) in
            (reversed ? value / 1093.613298: value * 1093.613298)},
        UnitPair(from: Length.Kilometers.rawValue, to: Length.Feet.rawValue): {(value:Double, reversed:Bool) in
            (reversed ? value / 3280.839895: value * 3280.839895)},
        
        UnitPair(from: Length.Yard.rawValue, to: Length.Feet.rawValue): {(value:Double, reversed:Bool) in
            (reversed ? value / 3: value * 3)},
    ]
    let volumePairs = [
        UnitPair(from: Volume.Gallons.rawValue, to: Volume.Cups.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 16: value * 16)},
        UnitPair(from: Volume.Gallons.rawValue, to: Volume.Pints.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 8: value * 8)},
        UnitPair(from: Volume.Gallons.rawValue, to: Volume.Liters.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 3.785412: value * 3.785412)},
        UnitPair(from: Volume.Gallons.rawValue, to: Volume.Milliliters.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 3785.411784: value * 3785.411784)},
        
        UnitPair(from: Volume.Liters.rawValue, to: Volume.Milliliters.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 1000: value * 1000)},
        UnitPair(from: Volume.Liters.rawValue, to: Volume.Cups.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 4.22675: value * 4.22675)},
        UnitPair(from: Volume.Liters.rawValue, to: Volume.Pints.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 2.11338: value * 2.11338)},
       
        UnitPair(from: Volume.Pints.rawValue, to: Volume.Cups.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 2: value * 2)},
        UnitPair(from: Volume.Pints.rawValue, to: Volume.Milliliters.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 473.176473: value * 473.176473)},
        
        UnitPair(from: Volume.Cups.rawValue, to: Volume.Milliliters.rawValue): {(value:Double, reversed:Bool) in (reversed ? value / 236.588: value * 236.588)},
        
    ]
    
}
