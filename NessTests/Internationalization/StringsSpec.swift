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

import Quick
import Nimble
@testable import Ness

class StringsSpec: QuickSpec {

    override func spec() {

        describe("func tests") {

            let testBundle = Bundle(for: StringsSpec.self)
            let table = "StringsSpec"
            
            context("When languageCode is valid") {

                context("Loading strings from a localized file, in en-US") {

                    let languageCode = "en-US"
                    
                    it("must load string from en-US localized string file") {
                        let loadedString = Strings.string("TestString1", languageCode: languageCode, bundle: testBundle, table: table, default: "String not found")
                        expect(loadedString).to(equal("TestString1 en-US"))
                    }

                    it("must return default string from en-US localized string file") {
                        let loadedString = Strings.string("Sbrubles", languageCode: languageCode, bundle: testBundle, table: table, default: "String not found")
                        expect(loadedString).to(equal("String not found"))
                    }

                }
                
                context("Loading strings from a localized file, in pt-BR") {

                    let languageCode = "pt-BR"

                    it("must load string from pt-BR localized string file") {
                        let loadedString = Strings.string("TestString1", languageCode: languageCode, bundle: testBundle, table: table, default: "String not found")
                        expect(loadedString).to(equal("TestString1 pt-BR"))
                    }

                    it("must return default string from pt-BR localized string file") {
                        let loadedString = Strings.string("Sbrubles", languageCode: languageCode, bundle: testBundle, table: table, default: "String not found")
                        expect(loadedString).to(equal("String not found"))
                    }

                }
                
            }

            context("When languageCode is not valid") {

                let languageCode = "ja"

                it("must load string from ja localized string file") {
                    let loadedString = Strings.string("TestString1", languageCode: languageCode, bundle: testBundle, table: table, default: "String not found")
                    expect(loadedString).to(equal("String not found"))
                }

            }

        }

    }

}
