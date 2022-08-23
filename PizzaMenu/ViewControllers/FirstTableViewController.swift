//
//  ViewController.swift
//  PizzaMenu
//
//  Created by Vetal on 10.07.2022.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    let listCategory = DishCategory.getDishCategoryes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonCart()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Categories.categories().count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! CustomTableViewCell
        cell.categoriesLabel.text = Categories.categories()[indexPath.row].name
        cell.categoriesImage.image =  UIImage(named: Categories.categories()[indexPath.row].name)
        cell.categoriesView.customViewDesing()
        cell.categoriesImage.customViewDesing()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let indexPath = tableView.indexPathForSelectedRow  else { return }
        let dishCollectionVC = segue.destination as! MenuListCollectionViewController
        dishCollectionVC.dishes = listCategory[indexPath.row].dish
        dishCollectionVC.category = listCategory[indexPath.row].name
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
    func customViewDesing() {
        self.layer.shadowOpacity = 30 
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 0.8, height: 1.1)
    }
}


