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
    
    func requestAuthoritation(completion: @escaping (Bool) -> Void){
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        guard let healthStore = self.healthStore
        else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [stepType]) { (sucess, error) in
            completion(sucess)
        }
    }
    
}
