//
//  BooksResult.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 16.12.22.
//

import Foundation

struct BooksResult {
    let id: Int
    let isbm, name, annotation: String
    let coverImage, preview: [Int]
    let price, pages: Int
    let publishingYear: Date
    let availability, coverStyle: Int
    let authors, categories, comments: [Any?]
    let publisherID: Int
}
