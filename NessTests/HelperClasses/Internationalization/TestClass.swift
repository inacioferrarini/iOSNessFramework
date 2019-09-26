import Foundation
import Common
import Ness

class TestClass {
}

extension TestClass: Internationalizable {

    var titleString: String {
        return string("str1", languageCode: "en-US")
    }
    
}
