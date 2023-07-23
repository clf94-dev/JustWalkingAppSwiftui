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
    @State private var steps: [Step] = [Step]()
    
    init () {
        healthStore = HealthStore()
    }
    private func updateUIFromStatistics (_ statisticsCollection: HKStatisticsCollection){
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
        }
    }
    var body: some View {
        VStack {
            NavigationView {
                List(steps, id: \.self) { step in
                    VStack(alignment: .leading) {
                        Text("\(step.count) steps")
                            .padding(.bottom, 5)
                        Text(step.date, style: .date)
                            .opacity(0.5)

                    }.padding(.vertical, 10)
                }
                .navigationTitle("Just Walking")
            }
                    .onAppear{
                        if let healthStore = healthStore {
                            healthStore.requestAuthoritation { success in
                                if success {
                                    healthStore.calculateSteps { statisticsCollection in
                                        if let statisticsCollection = statisticsCollection {
                                            // update UI que data
                                            updateUIFromStatistics(statisticsCollection)
                                        }
                                    }
                                }
                            }
                        }
                }
            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
