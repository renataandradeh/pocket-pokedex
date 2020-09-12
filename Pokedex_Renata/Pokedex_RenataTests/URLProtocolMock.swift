//
//  URLSessionMock.swift
//  Pokedex_RenataTests
//
//  Created by Renata Andrade on 11/09/20.
//  Copyright © 2020 Renata Gondim Andrade. All rights reserved.
//

import Foundation

class URLProtocolMock: URLProtocol {
    static var urls = [URL?: (error: Error?, data: Data?)]()

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let url = request.url, let (error, data) = URLProtocolMock.urls[url] else { return }
        
        if let data = data {
            self.client?.urlProtocol(self, didLoad: data)
        }
        
        if let error = error {
            self.client?.urlProtocol(self, didFailWithError: error)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
