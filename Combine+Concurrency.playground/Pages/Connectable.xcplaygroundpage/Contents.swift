//: [Previous](@previous)
// https://developer.apple.com/documentation/combine/controlling-publishing-with-connectable-publishers

import Foundation
import Combine

let url = URL(string: "https://example.com/")!
let connectable = URLSession.shared
    .dataTaskPublisher(for: url)
    .map() { $0.data }
    .catch() { _ in Just(Data() )}
    .share()
    .makeConnectable()

var cancellable1: Cancellable? = nil
var cancellable2: Cancellable? = nil
var connection: Cancellable? = nil

cancellable1 = connectable
    .sink(receiveCompletion: { print("Received completion 1: \($0).") },
          receiveValue: { print("Received data 1: \($0.count) bytes.") })


DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    cancellable2 = connectable
        .sink(receiveCompletion: { print("Received completion 2: \($0).") },
              receiveValue: { print("Received data 2: \($0.count) bytes.") })
}

//DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//    connection = connectable.connect()
//}

// MARK: - Autoconnect
let cancellable = Timer.publish(every: 1, on: .main, in: .default)
    .autoconnect()
    .sink() { date in
        print ("Date now: \(date)")
     }

//: [Next](@next)
