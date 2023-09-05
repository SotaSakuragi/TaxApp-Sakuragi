//
//  TableViewController.swift
//  TaxApp
//
//  Created by 櫻木颯大 on 2023/09/04.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculationField: UITextField!
    var numbers: [Double] = []
    var taxRate: Double = 1.1
    
    
    func textFieldInt() -> Int? {
        if let text = calculationField.text, let intValue = Int(text) {
            // テキストが整数
            return intValue
        } else {
            showAlert(title: "エラー!", message: "数字を入力してください")
            return nil
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculationField.keyboardType = .numberPad
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func tex(_ sender: Any) {
        if let intValue = textFieldInt() {
            switch (sender as AnyObject).selectedSegmentIndex {
            case 0:
                taxRate = 1.1
                print(taxRate)
                let result = Double(intValue) * 1.1
                resultLabel.text = String(format: "%.2f", result)
            case 1:
                taxRate = 1.08
                print(taxRate)
                let result = Double(intValue) * 1.08
                resultLabel.text = String(format: "%.2f", result)
            default:
                break
            }
        }
        
    }
    @IBAction func setButton(_ sender: Any) {
        print(taxRate)
        if let resultText = resultLabel.text, let resultValue = Double(resultText) {
            numbers.append(Double(resultValue))
            print(numbers)
            let userDefaults = UserDefaults.standard
                    userDefaults.set(numbers, forKey: "add")
            tableView.reloadData()

        }
    }
    
    
    
    @IBAction func inputField(_ sender: UITextField) {
        print("動いたよ")
        if let intValue = textFieldInt() {
            let result = Double(intValue) * taxRate
            resultLabel.text = String(format: "%.2f", result)
        }
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) // 表示作成
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)           // ボタン作成
        alert.addAction(alertAction)                                                          // 表示にボタンを追加
        present(alert, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("確認")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("操作")
        return numbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let number = numbers[indexPath.row]
        cell.textLabel?.text = "\(number)"
        print("動け")
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
