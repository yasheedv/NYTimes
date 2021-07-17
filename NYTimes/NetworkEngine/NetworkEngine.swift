//
//  NetworkEngine.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation
/**
 Create an instance for NetworkEngine and use dataTask method to perform URL dataTask
*/
final class NetworkEngine: NSObject {
    private lazy var sessionManager: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        configuration.timeoutIntervalForResource = 30
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    /**
     dataTask method is used to perform a network request
     - Parameter urlBuildable: Will be Any class or struct that should be confirmed to URLBuildable protocol
     - Parameter responseModel:  Is used to decode the recieved response
     - Parameter completion:  Call back with success or failure cases
     */
    func dataTask<T: URLBuildable, U: Decodable>(urlBuildable: T,
                                                 responseModel: U.Type,
                                                 completion: @escaping ResponseHandler<U>) {
        let request = urlBuildable.asURLRequest()
        CommonLoader.showSpinner()
        let dataTask = sessionManager.dataTask(with: request) { (data, urlResponse, error) in
            CommonLoader.hideSpinner()
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.customError(error: error.localizedDescription)))
                } else if let data = data {
                    self.getModel(model: responseModel, data, completion: completion)
                } else {
                    completion(.failure(.emptyResponse))
                }
            }
        }
        dataTask.resume()
    }
    /**
     getModel method will try to decode with given model
     - Parameter model: Decoding model
     - Parameter data: Data response from dataTask
     - Parameter completion:  Call back with success or failure cases
     */
    private func getModel<R: Decodable>(model: R.Type,
                                        _ data: Data,
                                        completion: @escaping ResponseHandler<R>) {
        do {
            let dataModel = try JSONDecoder().decode(model.self, from: data)
            completion(.success(dataModel))
        } catch let error {
            return completion(.failure(.customError(error: error.localizedDescription)))
        }
    }
}

