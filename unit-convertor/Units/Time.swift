//
//  Time.swift
//  unit-convertor
//
//  Created by Ivan Hedz on 12.08.2022.
//

import SwiftUI

enum Time: String, Equatable, CaseIterable {
    case Second
    case Minute
    case Hour
    case Day
    var localizedName: LocalizedStringKey {LocalizedStringKey(rawValue)}
}
