//
//  Step.swift
//  JustWalkingApp
//
//  Created by Carmen Lucas on 23/7/23.
//

import Foundation

struct Step: Identifiable, Hashable {
    let id = UUID()
    let count: Int
    let date: Date
}
