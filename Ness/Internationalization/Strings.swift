//    The MIT License (MIT)
//
//    Copyright (c) 2017 Inácio Ferrarini
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

///
/// Ease the usage of strings from different String tables.
///
public struct Strings {

    ///
    /// Returns the String that matches the given `stringName` in the given `table` for the given `languageCode`.
    /// If no matching string is retrieved, `default` will be returned.
    ///
    /// - stringName: The name of the string key to be retrieved.
    /// - languageCode: The code for the language. en-US, pt-BR, etc.
    /// - bundle: The bundle where the given string table is located.
    /// - table: The string file where the `stringName` is located.
    /// - `default`: A string to be returned if a matching string cannot be found.
    /// - Returns: The required string or `default`.
    ///
    public static func string(_ stringName: String, languageCode: String, bundle: Bundle, table: String? = nil, `default`: String = "Not Found") -> String {
        if let path = bundle.path(forResource: languageCode, ofType: "lproj"),
            let languageBundle = Bundle(path: path) {
            return languageBundle.localizedString(forKey: stringName, value: `default`, table: table)
        }
        return `default`
    }

}
