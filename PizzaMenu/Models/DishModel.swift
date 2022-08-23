//
//  DishModel.swift
//  PizzaMenu
//
//  Created by Vetal on 18.08.2022.
//

struct Dish: Hashable {
    let typeDish : DishCategoryName
    let name  : String
    let price : Double
    let photo : String
    let description : String?
}
