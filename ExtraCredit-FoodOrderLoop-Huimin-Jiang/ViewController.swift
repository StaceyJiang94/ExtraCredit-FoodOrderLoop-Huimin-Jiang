//
//  ViewController.swift
//  ExtraCredit-FoodOrderLoop-Huimin-Jiang
//
//  Created by Huimin Jiang on 3/23/20.
//  Copyright © 2020 Huimin Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodNamePriceLabel: UILabel!
    
    @IBOutlet weak var foodOrderReceiptView: UITextView!
    
    let foodImageArray = ["chicken", "hamburger", "noodle", "pasta", "pizza", "salad", "steak"]
    
    let foodNameArray = ["Roasted Chicken", "Classic Burger", "Chicken Noodle Soup", "Bow-Tie Pasta", "Pepperoni Pizza", "Italian Salad", "Grilled Steak"]
    
    let foodPriceArray = [13.99, 13.99, 11.99, 12.99, 11.99, 10.99, 15.99]
    
    var foodIndex = 0
    
    var chosenFoodNameArray: [String] = []
    
    var chosenFoodPriceArray: [Double] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodImageView.image = UIImage(named: foodImageArray[foodIndex])
        
        foodNamePriceLabel.text = "\(foodNameArray[foodIndex]) : $ \(foodPriceArray[foodIndex])"
        
        foodOrderReceiptView.text = "Food Order in Your Cart:"
    }

    
    @IBAction func nextDishButtonClicked(_ sender: UIButton) {
        
        foodIndex += 1
        if foodIndex == foodImageArray.count{
            foodIndex = 0
        }
        
        foodImageView.image = UIImage(named: foodImageArray[foodIndex])
        
        foodNamePriceLabel.text = "\(foodNameArray[foodIndex]) : $ \(foodPriceArray[foodIndex])"
    }
    
    
    @IBAction func addToCartButtonClicked(_ sender: UIButton) {
        var totalCost = 0.0
        var allFoodAdd = ""
        
        foodImageView.tag = foodIndex

        chosenFoodNameArray.append(foodNameArray[foodImageView.tag])

        chosenFoodPriceArray.append(foodPriceArray[foodImageView.tag])

        for count in 0...chosenFoodNameArray.count-1{
            allFoodAdd = allFoodAdd + "\n \(chosenFoodNameArray[count]) : $ \(chosenFoodPriceArray[count])"
            totalCost = totalCost + chosenFoodPriceArray[count]
        }
            
        print(allFoodAdd)
        print(totalCost)

        foodOrderReceiptView.text = "Food Order in Your Cart: \n\(allFoodAdd) \n\n Total Cost: \(totalCost)"
        
   }

}
