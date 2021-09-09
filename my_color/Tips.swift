//
//  Tips.swift
//  my_color
//
//  Created by Sam Gundotra on 8/26/21.
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}

