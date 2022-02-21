//___FILEHEADER___

import XCTest

class ___FILEBASENAMEASIDENTIFIER___: XCTestCase {

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        testCode()
    }
    
    
    func testCode() {
        (0..<15).forEach {
            guard $0 > 0 && $0 <= 13 else {
                print("nil")
                return
            }
            let card = CardData(pattern: .clover, number: $0)
            print(card.toString())
        }
    }

}
