//: [Previous](@previous)
// https://developer.apple.com/documentation/combine/routing-notifications-to-combine-subscribers

import Foundation
import Combine

//MARK: - orientationDidChangeNotification
var cancellable = NotificationCenter.default
    .publisher(for: UIDevice.orientationDidChangeNotification)
    .filter() { _ in UIDevice.current.orientation == .portrait }
    .sink() { _ in print ("Orientation changed to portrait.") }

//: [Next](@next)
