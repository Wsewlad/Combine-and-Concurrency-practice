//: [Previous](@previous)
import Combine
import Foundation

//MARK: - Future
func generateAsyncRandomNumberFromFuture() -> Future <Int, Never> {
    return Future() { promise in
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let number = Int.random(in: 1...10)
            promise(Result.success(number))
        }
    }
}

var cancellable = generateAsyncRandomNumberFromFuture()
    .sink { number in print("[Future] Got random number \(number).") }


// MARK: - Future + Swift Concurrency
let number = await generateAsyncRandomNumberFromFuture().value
print("[Future + Concurrency] Got random number \(number).")


// MARK: - Swift Concurrency
func generateAsyncRandomNumberFromContinuation() async -> Int {
    return await withCheckedContinuation { continuation in
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let number = Int.random(in: 1...10)
            continuation.resume(returning: number)
        }
    }
}

let asyncRandom = await generateAsyncRandomNumberFromContinuation()
print("[Concurrency] Got random number \(asyncRandom).")
//: [Next](@next)
