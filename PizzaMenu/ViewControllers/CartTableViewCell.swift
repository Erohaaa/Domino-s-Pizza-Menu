//
//  CartTableViewCell.swift
//  PizzaMenu
//
//  Created by Vetal on 21.08.2022.
//

import UIKit

protocol CartTableViewCellDelegate {
    func didTappedStepper(cell: CartTableViewCell)
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet var dishStepper: UIStepper!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var contentViewPhoto: UIView!
    @IBOutlet var photoView: UIView!
    @IBOutlet var photoImageView: UIImageView!
    
    var delegate: CartTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dishStepper.customViewDesing()
    }
    
    @IBAction func stepperDidTapped() {
        delegate.didTappedStepper(cell: self)
    }
    
    func constructTextForCountLabel() -> String {
        return "x " + String(Int(dishStepper.value)) + " шт."
    }


}
