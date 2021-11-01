//
//  Session+Request.swift
//  Fusion
//
//  Created by Ben Shutt on 27/10/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import Alamofire

/// URL request success
struct RequestSuccess {

    /// Response from the API
    let response: AFDataResponse<Data>

    /// Successful data
    let data: Data
}

/// URL request failure
struct RequestFailure: Error {

    /// Response from the API
    ///
    /// - Note:
    /// This property is optional because the `fetch(...)` method could throw
    /// constructing the `URLRequest` (before making the API request)
    let response: AFDataResponse<Data>?

    /// Unsuccessful error
    let error: Error
}

/// `Result` where:
/// - Success is `RequestSuccess`
/// - Failure is `RequestFailure`
typealias RequestResult = Result<RequestSuccess, RequestFailure>

/// Completion closure with a `RequestResult`
typealias RequestCompletion = (RequestResult) -> Void

// MARK: - Session + Request

extension Session {

    /// Make an API request at the given `url` and complete with `completion` on `completionQueue`
    ///
    /// - Parameters:
    ///   - url: `URL`
    ///   - completionQueue: `DispatchQueue`
    ///   - completion: `RequestCompletion`
    func fetchJSONData(
        url: URL,
        completionQueue: DispatchQueue = .main,
        completion: @escaping RequestCompletion
    ) {
        let urlRequest: URLRequest
        do {
            urlRequest = try URLRequest(url: url, method: .get, headers: .fusionJSON)
        } catch {
            completionQueue.async {
                completion(.failure(
                    RequestFailure(response: nil, error: error)
                ))
            }
            return
        }

        request(urlRequest)
            .validate()
            .responseData(queue: completionQueue) { response in
                Fusion.shared.log(type: .debug, message: response.debugDescription)
                switch response.result {
                case let .success(data):
                    completion(.success(
                        RequestSuccess(response: response, data: data)
                    ))
                case let .failure(error):
                    completion(.failure(
                        RequestFailure(response: response, error: error)
                    ))
                }
            }
    }
}
