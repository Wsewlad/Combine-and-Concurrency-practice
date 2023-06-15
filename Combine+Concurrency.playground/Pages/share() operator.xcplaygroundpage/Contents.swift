//: [Previous](@previous)
// https://developer.apple.com/documentation/combine/fail/share()

import Foundation
import Combine

let pub = (1...3).publisher
    .delay(for: 1, scheduler: DispatchQueue.main)
    .map( { _ in return Int.random(in: 0...100) } )
    .print("Random")
    .share()


var cancellable1 = pub
    .sink { print ("Stream 1 received: \($0)")}
var cancellable2 = pub
    .sink { print ("Stream 2 received: \($0)")}

//: [Next](@next)
