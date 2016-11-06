//
//  AssetViewController.swift
//  financeCal
//
//  Created by IkegamiYuki on 2016/11/05.
//  Copyright © 2016 IkegamiYuki. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AssetViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var assetLabel: UILabel!
    
    var nameField: UITextField!
    var balanceField: UITextField!
    var interestField: UITextField!
    var timeField: UITextField!
    var allToolBar: UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assetLabel.text = "Asset"
        assetLabel.font = UIFont.systemFont(ofSize: 50)
        assetLabel.frame = CGRect(x: 0, y: 30, width: self.view.bounds.width, height: 50)
        assetLabel.textAlignment = NSTextAlignment.center

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
        
        balanceField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        balanceField.placeholder = "BALANCE"
        balanceField.center = CGPoint(x: self.view.bounds.width/2, y: 250)
        balanceField.textAlignment = NSTextAlignment.center
        balanceField.keyboardType = .decimalPad
        balanceField.delegate = self
        self.view.addSubview(balanceField)
        
        interestField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        interestField.placeholder = "INTEREST"
        interestField.center = CGPoint(x: self.view.bounds.width/2, y: 350)
        interestField.textAlignment = NSTextAlignment.center
        interestField.keyboardType = .decimalPad
        interestField.delegate = self
        self.view.addSubview(interestField)
        
        timeField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        timeField.placeholder = "TIME"
        timeField.center = CGPoint(x: self.view.bounds.width/2, y: 450)
        timeField.textAlignment = NSTextAlignment.center
        timeField.keyboardType = .numberPad
        timeField.delegate = self
        self.view.addSubview(timeField)
        
        allToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        allToolBar.barStyle = UIBarStyle.blackTranslucent
        let toolBarBtnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(AssetViewController.onClick))
        let toolBarBtnFlx = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        allToolBar.items = [toolBarBtnFlx,toolBarBtnDone]
        nameField.inputAccessoryView = allToolBar
        balanceField.inputAccessoryView = allToolBar
        interestField.inputAccessoryView = allToolBar
        timeField.inputAccessoryView = allToolBar
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
        let accountData = AccountEntity(context: context)
        let accFetchReq: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        let accFetchData = try! context.fetch(accFetchReq)
        accountData.accID = Int16(accFetchData.count)
        accountData.name = nameField.text
        accountData.kind = 1 as Int16
        do {
            try context.save()
        } catch  {
            print(error)
        }
        
        let assetData = AssetEntity(context: context)
        let assetFetchReq: NSFetchRequest<AssetEntity> = AssetEntity.fetchRequest()
        let assetFetchData = try! context.fetch(assetFetchReq)
        assetData.assetID = Int16(assetFetchData.count)
        assetData.balance = Double(balanceField.text!)!
        assetData.interest = Double(interestField.text!)!
        assetData.time = Int16(timeField.text!)!
        do {
            try context.save()
        }catch{
            print(error)
        }

        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "homeView")
        self.present(homeView!, animated: false, completion: nil)
    }
    
    @IBAction func pushBack(sender: UIButton){
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "homeView")
        self.present(homeView!, animated: false, completion: nil)
    }

    func onClick() {
        nameField.resignFirstResponder()
        interestField.resignFirstResponder()
        balanceField.resignFirstResponder()
        timeField.resignFirstResponder()
    }
}
