//
//  Networking.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import Foundation

struct Networking {

    func performNetworkTask<T: Codable>(endpoint: PayDayBankAPI,
                                        type: T.Type,
                                        completion: ((_ response: Array<T>) -> Void)?) {
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        let urlRequest = URLRequest(url: URL(string: urlString!)!)
//        if let params = params {
//            let  jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
//            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            urlRequest.httpBody = jsonData
//        }
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let error = error {
                print("URL: \(error)")
                return
            }
            guard let data = data else {
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                print("error response decoding")
                return
            }
            completion?(decoded)
        }
        urlSession.resume()
    }

}
