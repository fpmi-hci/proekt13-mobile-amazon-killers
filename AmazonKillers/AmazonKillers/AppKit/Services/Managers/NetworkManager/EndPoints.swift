//
//  EndPoints.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 16.12.22.
//

import Foundation

enum EndPoints {
    case getAllBooks
}

extension EndPoints {
    var baseUrl: String {
        switch self {
        case .getAllBooks:
            return "https://localhost:7084/Catalogue/books?pageSize=10&pageIndex=0&minPrice=0&maxPrice=10000&minPages=0&maxPages=2147483647&sortingBy=name&isDescending=false"
        }
    }
}
