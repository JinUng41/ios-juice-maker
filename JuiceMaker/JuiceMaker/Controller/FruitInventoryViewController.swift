//
//  FruitInventoryViewController.swift
//  JuiceMaker
//
//  Created by Wonji Ha on 2023/09/14.
//

import UIKit

final class FruitInventoryViewController: UIViewController {
    
    var juiceMaker: JuiceMaker?
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initIdentifier()
        bringStepperFruit()
    }
    
    private func initIdentifier() {
        strawberryLabel.accessibilityIdentifier = "딸기"
        bananaLabel.accessibilityIdentifier = "바나나"
        pineappleLabel.accessibilityIdentifier = "파인애플"
        kiwiLabel.accessibilityIdentifier = "키위"
        mangoLabel.accessibilityIdentifier = "망고"
        
        remainFruit()
    }
    
    private func remainFruit() {
        let labelArray: [UILabel] = [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel]
        
        labelArray.forEach { label in
            guard let id = label.accessibilityIdentifier else { return }
            
            do {
                guard let tempJuiceMaker = juiceMaker else { return }
                let fruit = try Fruit.identifyFruit(labelIdentifier: id)
                let count = try tempJuiceMaker.remainingCount(fruit: fruit)
                label.text = "\(count)"
                
            } catch {
                defaultAlert(message: InventoryError.invalidError.description)
            }
        }
    }
    
    private func bringStepperFruit() {
        
        do {
            guard let tempJuiceMaker = juiceMaker else { return }
            let count: UInt = try tempJuiceMaker.remainingCount(fruit: .strawberry)
            strawberryStepper.value = Double(count)
            
        } catch {
            defaultAlert(message: InventoryError.invalidError.description)
        }
    
        print("딸기 갯수:", strawberryStepper.value)
        remainFruit()
    }
    
    @IBAction private func strawberryStepperTapped(_ sender: UIStepper) {
        
        var count: UInt = UInt(sender.value)
        count += UInt(sender.value)
        print(count)
        
        juiceMaker?.fruitIncrease(fruit: .strawberry, newCount: count)
        remainFruit()
    }
    @IBAction func close(_ sender: UIButton) {
//        guard let pvc = self.presentingViewController else { return}
////        guard let MainVC = self.storyboard?.instantiateViewController(identifier: "MainVC") as? MainViewController else {
////            return
////        }
//        
//        dismiss(animated: true) {
//            pvc.present(MainViewController(), animated: true)
//        }
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
}

extension FruitInventoryViewController {
    private func defaultAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yes = UIAlertAction(title: "예", style: .default)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
}
