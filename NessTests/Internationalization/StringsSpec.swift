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
