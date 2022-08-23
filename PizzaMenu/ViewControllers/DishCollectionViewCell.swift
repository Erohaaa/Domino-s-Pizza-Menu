//
//  File.swift
//  PizzaMenu
//
//  Created by Vetal on 18.08.2022.
//

import UIKit

class DishCollectionViewCell: UICollectionViewCell {
    
    //MARK : - IB Outlets
    
    @IBOutlet var dishImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var dishView: UIView!
    @IBOutlet var dishCustomView: UIView!
    @IBOutlet var cartButton: UIButton!
    
    
    //MARK : - Public property
    var dish: Dish!
    
    
    @IBAction func addToCart() {
        Cart.shared.addDish(dish)
        cartButton.setImage(UIImage(named: "true"), for:.normal)
        cartButton.isEnabled = false
        }
    
    
    }


struct Constrants {
    static let leftDistanceToView: CGFloat = 20
    static let rightDistanceToView: CGFloat = 20
    static let minimumLineSpacing: CGFloat = 10 // расстояние между коллекциями
    static let topDistanceToView: CGFloat = 30
    static let bottomDistanceToView: CGFloat = 30
    static let width = 180
    static let height = 280
}

