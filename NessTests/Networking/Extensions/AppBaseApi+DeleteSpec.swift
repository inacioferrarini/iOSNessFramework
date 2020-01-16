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
import OHHTTPStubs
@testable import Ness

class AppBaseApiDeleteSpec: QuickSpec {
    
    override func spec() {
        
        describe("Base Api Request") {
            
            context("Delete method method") {
                
                afterEach {
                    OHHTTPStubs.removeAllStubs()
                }
                
                it("if request without body succeeds, must return valid object") {
                    // Given
                    stub(condition: isHost("www.apiurl.com") && isMethodDELETE()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        let error = OHHTTPStubsResponse(error:notConnectedError)
                        guard let fixtureFile = OHPathForFile("ApiGetRequestResponseFixture.json", type(of: self)) else { return error }
                        
                        return OHHTTPStubsResponse(
                            fileAtPath: fixtureFile,
                            statusCode: 200,
                            headers: ["Content-Type": "application/json"]
                        )
                    }
                    
                    var personResponse: PersonResponse? = nil
                    let api = AppBaseApi("https://www.apiurl.com")
                    let targetUrl = "/path"
                    
                    // When
                    waitUntil { done in
                        api.delete(
                            targetUrl: targetUrl,
                            headers: nil,
                            completionHandler: { (response: Response<PersonResponse?, Error>) in
                                switch response {
                                case .success(let response):
                                    personResponse = response
                                    done()
                                case .failure(let error):
                                    fail("Mocked response returned error - \(error)")
                                    done()
                                }
                        }, retryAttempts: 30)
                    }

                    // Then
                    expect(personResponse?["data"]?.count).to(equal(3))
                    
                    expect(personResponse?["data"]?[0].name).to(equal("John Doe"))
                    expect(personResponse?["data"]?[0].age).to(equal(35))
                    expect(personResponse?["data"]?[0].boolValue).to(equal(true))
                    
                    expect(personResponse?["data"]?[1].name).to(equal("John William"))
                    expect(personResponse?["data"]?[1].age).to(equal(40))
                    expect(personResponse?["data"]?[1].boolValue).to(equal(false))
                    
                    expect(personResponse?["data"]?[2].name).to(equal("Jacob Michael"))
                    expect(personResponse?["data"]?[2].age).to(equal(37))
                    expect(personResponse?["data"]?[2].boolValue).to(equal(true))
                }
                
                it("if request with body and headers succeeds, must return valid object") {
                    // Given
                    stub(condition: isHost("www.apiurl.com") && isMethodDELETE()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        let error = OHHTTPStubsResponse(error:notConnectedError)
                        guard let fixtureFile = OHPathForFile("ApiGetRequestResponseFixture.json", type(of: self)) else { return error }
                        
                        return OHHTTPStubsResponse(
                            fileAtPath: fixtureFile,
                            statusCode: 200,
                            headers: ["Content-Type": "application/json"]
                        )
                    }
                    
                    let headers = ["X-API-TOKEN" : "1234-12312-1231"]
                    let personRequest: PersonRequest? = PersonRequest()
                    var personResponse: PersonResponse? = nil
                    let api = AppBaseApi("https://www.apiurl.com")
                    let targetUrl = "/path"
                    
                    // When
                    waitUntil { done in
                        api.delete(
                            targetUrl: targetUrl,
                            requestObject: personRequest,
                            headers: headers,
                            completionHandler: { (response: Response<PersonResponse?, Error>) in
                                switch response {
                                case .success(let response):
                                    personResponse = response
                                    done()
                                case .failure(let error):
                                    fail("Mocked response returned error - \(error)")
                                    done()
                                }
                        }, retryAttempts: 30)
                    }

                    // Then
                    expect(personResponse?["data"]?.count).to(equal(3))
                    
                    expect(personResponse?["data"]?[0].name).to(equal("John Doe"))
                    expect(personResponse?["data"]?[0].age).to(equal(35))
                    expect(personResponse?["data"]?[0].boolValue).to(equal(true))
                    
                    expect(personResponse?["data"]?[1].name).to(equal("John William"))
                    expect(personResponse?["data"]?[1].age).to(equal(40))
                    expect(personResponse?["data"]?[1].boolValue).to(equal(false))
                    
                    expect(personResponse?["data"]?[2].name).to(equal("Jacob Michael"))
                    expect(personResponse?["data"]?[2].age).to(equal(37))
                    expect(personResponse?["data"]?[2].boolValue).to(equal(true))
                }
                
                it("if request fails, must execute failure block") {
                    // Given
                    stub(condition: isHost("www.apiurl.com") && isMethodDELETE()) { _ in
                        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                        return OHHTTPStubsResponse(error: notConnectedError)
                    }
                    
                    var personResponse: PersonResponse? = nil
                    let api = AppBaseApi("https://www.apiurl.com")
                    let targetUrl = "/path"
                    
                    // When
                    waitUntil { done in
                        api.delete(
                            targetUrl: targetUrl,
                            headers: nil,
                            completionHandler: { (response: Response<PersonResponse?, Error>) in
                                switch response {
                                case .success(let response):
                                    fail("Mocked response returned success")
                                    personResponse = response
                                    done()
                                case .failure(_):
                                    done()
                                }
                        }, retryAttempts: 30)
                    }

                    // Then
                    expect(personResponse).to(beNil())
                }
                
            }
            
        }
        
    }
    
}
