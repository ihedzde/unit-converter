//
//  Temperature.swift
//  unit-convertor
//
//  Created by Ivan Hedz on 12.08.2022.
//

import SwiftUI

enum Temperature: String, Equatable, CaseIterable {
    case Celsius
    case Fahrenheit
    case Kelvin
    var localizedName: LocalizedStringKey {LocalizedStringKey(rawValue)}
}
