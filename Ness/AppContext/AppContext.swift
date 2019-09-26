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
/// Used to share data among modules
///
public class AppContext {

    private var data: [String: Any] = [:]

    ///
    /// Public initializer.
    ///
    public init() {}

    ///
    /// Stores the given `value` using the given `key`.
    /// - Parameter value: Value to be stored.
    /// - Parameter key: Key to be used.
    ///
    public func set(value: Any, for key: String) {
        data[key] = value
    }

    ///
    /// Removes the value identified by the given `key`.
    /// - Parameter key: Key to be used.
    ///
    public func remove(key: String) {
        data.removeValue(forKey: key)
    }

    ///
    /// Retrieves the value identified by the given `key`.
    /// - Parameter key: Value identifier.
    ///
    public func get<T>(key: String) -> T? {
        guard data.keys.contains(key) else { return nil }
        return data[key] as? T
    }

}
