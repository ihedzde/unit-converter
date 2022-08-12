//
//  Volume.swift
//  unit-convertor
//
//  Created by Ivan Hedz on 12.08.2022.
//

import SwiftUI

enum Volume: String, Equatable, CaseIterable {
    case Milliliters
    case Liters
    case Cups
    case Pints
    case Gallons
    
    var localizedName: LocalizedStringKey {LocalizedStringKey(rawValue)}
}
