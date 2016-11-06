//
//  MyFinanceViewController.swift
//  financeCal
//
//  Created by IkegamiYuki on 2016/11/05.
//  Copyright © 2016 IkegamiYuki. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MyFinanceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var job: UIButton!
    @IBOutlet weak var asset: UIButton!
    @IBOutlet weak var debt: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var dataTableView: UITableView!
    
    var account:Array<Any>!
    
    var btn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn = 0
        
        titleLabel.text = "My Finance"
        titleLabel.font = UIFont.systemFont(ofSize: 50)
        titleLabel.frame = CGRect(x: 0, y: 30, width: self.view.bounds.width, height: 50)
        titleLabel.textAlignment = NSTextAlignment.center
        
        addBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addBtn.backgroundColor = UIColor.black
        addBtn.layer.cornerRadius = 50
        addBtn.setTitle("+", for: .normal)
        addBtn.center = CGPoint(x: 70, y: self.view.bounds.height-70)
        
        doneBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        doneBtn.backgroundColor = UIColor.black
        doneBtn.layer.cornerRadius = 50
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.center = CGPoint(x: self.view.bounds.width-70, y: self.view.bounds.height-70)

        job.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        job.backgroundColor = UIColor.black
        job.layer.cornerRadius = 50
        job.center = CGPoint(x: 70, y: self.view.bounds.height-70)
        job.setTitle("Job", for: .normal)
        job.alpha = 0
        
        asset.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        asset.backgroundColor = UIColor.black
        asset.layer.cornerRadius = 50
        asset.center = CGPoint(x: 70, y: self.view.bounds.height-70)
        asset.setTitle("Asset", for: .normal)
        asset.alpha = 0

        debt.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        debt.backgroundColor = UIColor.black
        debt.layer.cornerRadius = 50
        debt.center = CGPoint(x: 70, y: self.view.bounds.height-70)
        debt.setTitle("Debt", for: .normal)
        debt.alpha = 0
        
        dataTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        dataTableView.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height-100)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    @IBAction func pushAdd(sender: UIButton) {
        if btn == 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.job.alpha = 1
                self.job.center = CGPoint(x: 70, y: self.view.bounds.height-230)
                self.asset.alpha = 1
                self.asset.center = CGPoint(x: 200, y: self.view.bounds.height-200)
                self.debt.alpha = 1
                self.debt.center = CGPoint(x: 230, y: self.view.bounds.height-70)
                
            })
            btn = 1
        }else{
            UIView.animate(withDuration: 0.2, animations: {
                self.job.alpha = 0
                self.job.center = CGPoint(x: 70, y: self.view.bounds.height-70)
                self.asset.alpha = 0
                self.asset.center = CGPoint(x: 70, y: self.view.bounds.height-70)
                self.debt.alpha = 0
                self.debt.center = CGPoint(x: 70, y: self.view.bounds.height-70)
                
            })
            btn = 0
        }
    }
    
    @IBAction func pushDone(sender: UIButton){
        let expensiveView = self.storyboard?.instantiateViewController(withIdentifier: "expensiveView")
        self.present(expensiveView!, animated: false, completion: nil)
    }
    
    @IBAction func pushJob(sender: UIButton){
        let jobView = self.storyboard?.instantiateViewController(withIdentifier: "jobView")
        self.present(jobView!, animated: false, completion: nil)
    }
    
    @IBAction func pushAsset(sender: UIButton){
        let assetView = self.storyboard?.instantiateViewController(withIdentifier: "assetView")
        self.present(assetView!, animated: false, completion: nil)
    }
    
    @IBAction func pushDebt(sender: UIButton){
        let debtView = self.storyboard?.instantiateViewController(withIdentifier: "debtView")
        self.present(debtView!, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        let fetchReq: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        let fetchData = try! context.fetch(fetchReq)

        return fetchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        let fetchReq: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        let fetchData = try! context.fetch(fetchReq)
        if !fetchData.isEmpty {
            cell.textLabel?.text = fetchData[indexPath.row].name
            cell.textLabel?.textAlignment = NSTextAlignment.center
        }
        
        return cell
    }
    
}
