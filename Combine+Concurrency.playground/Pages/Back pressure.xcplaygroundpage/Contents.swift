//: [Previous](@previous)
// https://developer.apple.com/documentation/combine/processing-published-elements-with-subscribers

import Foundation
import Combine

// Publisher: Uses a timer to emit the date once per second.
let timerPub = Timer.publish(every: 1, on: .main, in: .default)
    .autoconnect()

// Subscriber: Waits 5 seconds after subscription, then requests a
// maximum of 3 values.
class MySubscriber: Subscriber {
    typealias Input = Date
    typealias Failure = Never
    var subscription: Subscription?
    
    func receive(subscription: Subscription) {
        print("published                             received")
        self.subscription = subscription
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            subscription.request(.max(3))
        }
    }
    
    func receive(_ input: Date) -> Subscribers.Demand {
        print("\(input)             \(Date())")
        return Subscribers.Demand.none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print ("--done--")
    }
}


// Subscribe to timerPub.
let mySub = MySubscriber()
print("Subscribing at \(Date())")
timerPub.subscribe(mySub)

//: [Next](@next)
