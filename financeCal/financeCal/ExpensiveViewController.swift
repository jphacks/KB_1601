//
//  ExpensiveViewController.swift
//  financeCal
//
//  Created by IkegamiYuki on 2016/11/05.
//  Copyright © 2016 IkegamiYuki. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ExpensiveViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var expensiveLabel: UILabel!
    
    var nameField: UITextField!
    var amountField: UITextField!
    var payField: UITextField!
    var paymentField: UITextField!
    var purchaseField: UITextField!
    var allToolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expensiveLabel.text = "Expense"
        expensiveLabel.font = UIFont.systemFont(ofSize: 50)
        expensiveLabel.frame = CGRect(x: 0, y: 30, width: self.view.bounds.width, height: 50)
        expensiveLabel.textAlignment = NSTextAlignment.center
        
        backBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        backBtn.backgroundColor = UIColor.black
        backBtn.layer.cornerRadius = 50
        backBtn.setTitle("Back", for: .normal)
        backBtn.center = CGPoint(x: 70, y: self.view.bounds.height-70)
        
        doneBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        doneBtn.backgroundColor = UIColor.black
        doneBtn.layer.cornerRadius = 50
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.center = CGPoint(x: self.view.bounds.width-70, y: self.view.bounds.height-70)
        
        nameField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        nameField.placeholder = "NAME"
        nameField.center = CGPoint(x: self.view.bounds.width/2, y: 150)
        nameField.textAlignment = NSTextAlignment.center
        nameField.delegate = self
        self.view.addSubview(nameField)
        
        amountField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        amountField.placeholder = "BALANCE"
        amountField.center = CGPoint(x: self.view.bounds.width/2, y: 250)
        amountField.textAlignment = NSTextAlignment.center
        amountField.keyboardType = .decimalPad
        amountField.delegate = self
        self.view.addSubview(amountField)
        
        payField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        payField.placeholder = "PAYMENT TIME"
        payField.center = CGPoint(x: self.view.bounds.width/2, y: 350)
        payField.textAlignment = NSTextAlignment.center
        payField.keyboardType = .decimalPad
        payField.delegate = self
        self.view.addSubview(payField)
        
        paymentField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        paymentField.placeholder = "PAYMENT"
        paymentField.center = CGPoint(x: self.view.bounds.width/2, y: 450)
        paymentField.textAlignment = NSTextAlignment.center
        paymentField.keyboardType = .numberPad
        paymentField.delegate = self
        self.view.addSubview(paymentField)
        
        purchaseField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        purchaseField.placeholder = "PURCHASE TIME"
        purchaseField.center = CGPoint(x: self.view.bounds.width/2, y: 550)
        purchaseField.textAlignment = NSTextAlignment.center
        purchaseField.keyboardType = .numberPad
        purchaseField.delegate = self
        self.view.addSubview(purchaseField)
        
        allToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        allToolBar.barStyle = UIBarStyle.blackTranslucent
        let toolBarBtnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(JobViewController.onClick))
        let toolBarBtnFlx = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        allToolBar.items = [toolBarBtnFlx,toolBarBtnDone]
        nameField.inputAccessoryView = allToolBar
        amountField.inputAccessoryView = allToolBar
        payField.inputAccessoryView = allToolBar
        paymentField.inputAccessoryView = allToolBar
        purchaseField.inputAccessoryView = allToolBar
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func pushDone(sender: UIButton){
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        let expenseData = ExpenseEntity(context: context)
        let expenseFetchReq: NSFetchRequest<ExpenseEntity> = ExpenseEntity.fetchRequest()
        let expenseFetchData = try! context.fetch(expenseFetchReq)
        
        expenseData.name = nameField.text!
        expenseData.amount = Int16(amountField.text!)!
        expenseData.expenseID = Int16(expenseFetchData.count)
        expenseData.interest = Double(paymentField.text!)!
        expenseData.payTime = Int16(payField.text!)!
        expenseData.purchaseTime = Int16(purchaseField.text!)!
        do {
            try context.save()
        } catch  {
            print(error)
        }
        
        let resultView = self.storyboard?.instantiateViewController(withIdentifier: "resultView")
        self.present(resultView!, animated: false, completion: nil)
    }
    
    @IBAction func pushBack(sender: UIButton){
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "homeView")
        self.present(homeView!, animated: false, completion: nil)
    }
    
    func onClick() {
        nameField.resignFirstResponder()
        payField.resignFirstResponder()
        amountField.resignFirstResponder()
        paymentField.resignFirstResponder()
        purchaseField.resignFirstResponder()
    }
    
}
