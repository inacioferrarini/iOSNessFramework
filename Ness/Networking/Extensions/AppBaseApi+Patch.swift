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

public extension AppBaseApi {

    /// Performs a `patch` request without body.
    ///
    /// - Parameters:
    ///
    /// - parameter targetUrl: The request path.
    ///
    /// - parameter headers: Http Headers to be sent with the request.
    ///
    /// - parameter success: The block to be called if request succeeds.
    ///
    /// - parameter failure: The block to be called if request fails.
    ///
    /// - parameter retryAttempts: How many tries before calling `errorHandler` block.
    ///
    public func patch<ResponseType>(
        targetUrl: String,
        headers: [String: String]? = nil,
        success: @escaping ((ResponseType?) -> Void),
        failure: @escaping ((Error) -> Void),
        retryAttempts: Int) where ResponseType: Decodable {

        executeRequest(httpMethod: .patch,
                       targetUrl: targetUrl,
                       requestObject: EmptyRequest(),
                       headers: headers,
                       success: success,
                       failure: failure,
                       retryAttempts: retryAttempts)

    }

    /// Performs a `patch` request with `requestObject` as body.
    ///
    /// - Parameters:
    ///
    /// - parameter targetUrl: The request path.
    ///
    /// - requestObject: body data to be sent with the request
    ///
    /// - parameter headers: Http Headers to be sent with the request.
    ///
    /// - parameter success: The block to be called if request succeeds.
    ///
    /// - parameter failure: The block to be called if request fails.
    ///
    /// - parameter retryAttempts: How many tries before calling `errorHandler` block.
    ///
    public func patch<RequestType, ResponseType>(
        targetUrl: String,
        requestObject: RequestType,
        headers: [String: String]? = nil,
        success: @escaping ((ResponseType?) -> Void),
        failure: @escaping ((Error) -> Void),
        retryAttempts: Int) where RequestType: Encodable, ResponseType: Decodable {

        executeRequest(httpMethod: .patch,
                       targetUrl: targetUrl,
                       requestObject: requestObject,
                       headers: headers,
                       success: success,
                       failure: failure,
                       retryAttempts: retryAttempts)

    }

}
