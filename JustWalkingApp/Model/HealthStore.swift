//
//  HealthStore.swift
//  JustWalkingApp
//
//  Created by Carmen Lucas on 23/7/23.
//

import Foundation
import HealthKit

class HealthStore {
    var healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
}
