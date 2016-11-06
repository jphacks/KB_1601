//
//  JobViewController.swift
//  financeCal
//
//  Created by IkegamiYuki on 2016/11/05.
//  Copyright © 2016 IkegamiYuki. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class JobViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var jobLabel: UILabel!
    
    var nameField: UITextField!
    var salaryField: UITextField!
    var freqField: UITextField!
    var allToolBar: UIToolbar!
    var freqToolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobLabel.text = "Job"
        jobLabel.font = UIFont.systemFont(ofSize: 50)
        jobLabel.frame = CGRect(x: 0, y: 30, width: self.view.bounds.width, height: 50)
        jobLabel.textAlignment = NSTextAlignment.center

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
        
        salaryField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        salaryField.placeholder = "SALARY"
        salaryField.center = CGPoint(x: self.view.bounds.width/2, y: 250)
        salaryField.textAlignment = NSTextAlignment.center
        salaryField.keyboardType = .numberPad
        salaryField.delegate = self
        self.view.addSubview(salaryField)

        freqField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*4/5, height: 50))
        freqField.placeholder = "FREQENCY"
        freqField.center = CGPoint(x: self.view.bounds.width/2, y: 350)
        freqField.textAlignment = NSTextAlignment.center
        freqField.keyboardType = .numberPad
        freqField.delegate = self
        self.view.addSubview(freqField)
        
        allToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        allToolBar.barStyle = UIBarStyle.blackTranslucent
        let toolBarBtnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(JobViewController.onClick))
        let toolBarBtnFlx = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        allToolBar.items = [toolBarBtnFlx,toolBarBtnDone]
        nameField.inputAccessoryView = allToolBar
        salaryField.inputAccessoryView = allToolBar
        freqField.inputAccessoryView = allToolBar
        
        
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
        
        let jobData = JobEntity(context: context)
        let jobFetchReq: NSFetchRequest<JobEntity> = JobEntity.fetchRequest()
        let jobFetchData = try! context.fetch(jobFetchReq)
        jobData.jobID = Int16(jobFetchData.count)
        jobData.salary = Int16(salaryField.text!)!
        jobData.freqency = Int16(freqField.text!)!
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
        freqField.resignFirstResponder()
        salaryField.resignFirstResponder()
    }
}
