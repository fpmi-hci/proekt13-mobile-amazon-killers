//
//  MockData.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 11.11.22.
//

import Foundation

var data = ["Recommendations",
            "New Arrivals",
            "Best Sellers",
            "Recommendations",
            "New Arrivals",
            "Best Sellers"]

struct Book: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var author: String
    var overview: String
    var rating: Decimal
    var cover: String
}

let bookData = [
    Book(name: "Catcher in the Rye",
         author: "J.D. Salinger",
         overview: "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique",
         rating: 1.0,
         cover: "https://cdn.britannica.com/94/181394-050-2F76F7EE/Reproduction-cover-edition-The-Catcher-in-the.jpg"),
    Book(name: "Someone Like You",
         author: "Roald Dahl",
         overview: "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique",
         rating: 3.8,
         cover: "https://m.media-amazon.com/images/I/81p55MXP8zL.jpg"),
    Book(name: "Harry Potter and the Philosopher's Stone",
         author: "J. K. Rowling",
         overview: "The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique",
         rating: 5.0,
         cover: "https://cdn.thestorygraph.com/65bt6m665583zyhuxylga3avwp32")
]
