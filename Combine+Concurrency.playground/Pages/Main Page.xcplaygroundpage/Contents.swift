import Combine
import Foundation

let publisher = ["hey", "there", "Swift", "Heroes"].publisher

var cancellable = publisher.sink { print("\($0)") } receiveValue: { print("\($0)") }


