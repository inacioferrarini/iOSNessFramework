//    The MIT License (MIT)
//
//    Copyright (c) 2019 Inácio Ferrarini
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import Foundation
import Quick
import Nimble
@testable import Ness

class ArrayNSPredicateSpec: QuickSpec {
    
    override func spec() {
        
        let array = ["A", "B", "AB"]
        
        it("NSPredicate must filter elements") {
            let predicate = NSPredicate(format: "SELF == %@", "A")
            let filteredArray = array.filter(using: predicate)
            expect(filteredArray).toNot(beNil())
            expect(filteredArray?.count).to(equal(1))
            expect(filteredArray?.first).to(equal("A"))
        }

        it("NSPredicate must filter elements") {
            let predicate = NSPredicate(format: "SELF LIKE[CD] %@", "a*")
            let filteredArray = array.filter(using: predicate)
            expect(filteredArray).toNot(beNil())
            expect(filteredArray?.count).to(equal(2))
            expect(filteredArray?.contains("A")).to(beTruthy())
            expect(filteredArray?.contains("AB")).to(beTruthy())
        }
        
    }
    
}

