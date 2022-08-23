//
//  ModelMenu1.swift
//  PizzaMenu
//
//  Created by Vetal on 11.07.2022.
//

import Foundation

struct Categories {
    var name: String
}

extension Categories {
    static func categories() -> [Categories] {
        return [Categories(name: "Піца"),
                Categories(name: "Сайди"),
                Categories(name: "Десерти"),
                Categories(name: "Напої"),
            ]
    }
}
