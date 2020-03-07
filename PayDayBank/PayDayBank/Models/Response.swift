//
//  File.swift
//  PayDayBank
//
//  Created by Сергей Мирошниченко on 07.03.2020.
//  Copyright © 2020 7rlines. All rights reserved.
//

import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> Array<T>? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(Array<T>.self, from: data)
            return response
        } catch let error {
            print(error)
            return nil
        }
    }
}
