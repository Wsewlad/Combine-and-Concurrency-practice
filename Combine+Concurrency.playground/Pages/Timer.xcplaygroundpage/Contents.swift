//: [Previous](@previous)
// https://developer.apple.com/documentation/combine/replacing-foundation-timers-with-timer-publishers

import Foundation
import Combine

var lastUpdated = Date()

var cancellable = Timer.publish(every: 5, on: .main, in: .default)
        .autoconnect()
        .receive(on: RunLoop.main)
        .print()
        .sink { date in
            lastUpdated = date
        }

//: [Next](@next)
