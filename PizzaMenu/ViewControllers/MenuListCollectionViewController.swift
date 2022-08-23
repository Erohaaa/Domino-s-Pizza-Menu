//
//  MenuListCollectionViewController.swift
//  PizzaMenu
//
//  Created by Vetal on 18.08.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class MenuListCollectionViewController: UICollectionViewController {

    //MARK: - Public Property
    var dishes : [Dish]!
    var category : DishCategoryName!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        addButtonCart()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dishCell", for: indexPath) as! DishCollectionViewCell
        
        cell.dish = dishes[indexPath.item]
        cell.nameLabel.text = dishes[indexPath.item].name
        cell.priceLabel.text = "\(String(format: "%.0f", dishes[indexPath.item].price)) грн"
        cell.dishImage.customView()
        cell.cartButton.customView()
        cell.dishView.customView()
        cell.dishCustomView.customView()
        cell.dishImage.image = UIImage(named: dishes[indexPath.item].name)
        
        return cell
    }
    
    //MARK: - Private Methods
    
    // Задаю розміри в dishCell.
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constrants.minimumLineSpacing
        collectionView.contentInset = UIEdgeInsets(top: Constrants.topDistanceToView ,
                                                   left: Constrants.leftDistanceToView ,
                                                   bottom: Constrants.bottomDistanceToView,
                                                   right: Constrants.rightDistanceToView)
        layout.itemSize = CGSize(width: Constrants.width , height: Constrants.height)
        collectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems  else { return }
        guard let numberofitem = indexPath.first else { return }
        let descriptionDishVC = segue.destination as! DescriptionDishViewController
        descriptionDishVC.dish = dishes[numberofitem.item]
    }
    
    // Кнопка кошика в NB
    private func addButtonCart() {
        guard let image = UIImage(named: "cart") else { return }
        let cartButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(goToCart))
        navigationItem.setRightBarButton(cartButton, animated: true)
        
    }
    
    @objc func goToCart() {
        performSegue(withIdentifier: "CartStoryboard", sender: nil)
    }
}



//MARK: - Extensions

extension MenuListCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constrants.width, height: Constrants.height)
    }
}


extension UIView {
    func customView() {
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 1.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize.zero
    }
}




    
    
