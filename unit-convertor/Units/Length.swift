//
//  Length.swift
//  unit-convertor
//
//  Created by Ivan Hedz on 12.08.2022.
//

import SwiftUI

enum Length: String, Equatable, CaseIterable {
    case Kilometers
    case Feet
    case Yard
    case Mile
    var localizedName: LocalizedStringKey {LocalizedStringKey(rawValue)}
}
