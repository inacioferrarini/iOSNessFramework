import Quick
import Nimble
@testable import Ness

class InternationalizableSpec: QuickSpec {

    override func spec() {

        describe("func tests") {

            it("String from class must returned internationalizable string") {
                let string = TestClass().titleString
                expect(string).to(equal("String 1"))
            }

        }

    }

}
