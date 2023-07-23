//
//  ContentView.swift
//  JustWalkingApp
//
//  Created by Carmen Lucas on 23/7/23.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    private var healthStore: HealthStore?
    
    init () {
        healthStore = HealthStore()
    }
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            if let healthStore = healthStore {
                healthStore.requestAuthoritation { success in
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
