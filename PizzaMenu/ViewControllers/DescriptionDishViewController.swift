//
//  DescriptionDishViewController.swift
//  PizzaMenu
//
//  Created by Vetal on 18.08.2022.
//

import UIKit

class DescriptionDishViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceView: UIView!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var viewCustom: UIView!
    @IBOutlet var cardButton: UIButton!
    
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillingCell()
        customDesign()
        navigationItem.largeTitleDisplayMode = .never
        addButtonCart()
    }
    
    @IBAction func cartButtonPressed() {
        Cart.shared.addDish(dish)
        dismiss(animated: true)
        cardButton.isEnabled = false
        cardButton.backgroundColor = .gray
        cardButton.setTitle("Додано в кошик", for: .normal)
    }
    
    
        private func fillingCell() {
        nameLabel.text = dish.name
        priceLabel.text = " \(String(format: "%.0f", dish.price)) грн."
        dishImageView.image = UIImage(named: dish.photo)
        descriptionTextView.text = dish.description ?? dish.name
            if descriptionTextView.text == "" {
                descriptionTextView.isHidden = true
            } else { descriptionTextView.text = dish.description }
    }
    
    private func customDesign() {
        priceView.designView()
        contentView.designView()
        dishImageView.designView()
        viewCustom.designView()
        cardButton.designView()
        descriptionTextView.designView()
    }
    
    private func addButtonCart() {
        guard let image = UIImage(named: "cart") else { return }
        let cartButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(goToCart))
        navigationItem.setRightBarButton(cartButton, animated: true)
    }
    
    @objc func goToCart() {
        performSegue(withIdentifier: "CartStoryboard", sender: nil)
    }
}


extension UIView {
    func designView() {
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 1.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize.zero
    }
}
