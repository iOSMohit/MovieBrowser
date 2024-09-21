//
//  Dictionary+URLQueryItem.swift
//  MovieBrowser
//
//  Created by Mohit Kumar on 21/09/24.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    func getQueryItems() -> [URLQueryItem] {
        return map { key, value in
            URLQueryItem(name: key, value: value)
        }
    }
}
