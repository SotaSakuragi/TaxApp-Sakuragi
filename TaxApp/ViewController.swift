//
//  ViewController.swift
//  TaxApp
//
//  Created by 櫻木颯大 on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {
    var numbers: [Int] = []

    @IBOutlet weak var additionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            numbers = userDefaults.object(forKey: "add") as! [Int]
            print(numbers)
            let sum = numbers.reduce(0, +)
            print("合計: \(sum)")
            additionLabel.text = "合計: \(sum)"
            // Do any additional setup after loading the view.
        }
    }
    
    

    @IBAction func sharebutton(_ sender: Any) {
    }
    
}

