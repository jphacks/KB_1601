//
//  ExpenseEntity+CoreDataProperties.swift
//  financeCal
//
//  Created by IkegamiYuki on 2016/11/06.
//  Copyright © 2016 IkegamiYuki. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ExpenseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseEntity> {
        return NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity");
    }

    @NSManaged public var expenseID: Int16
    @NSManaged public var amount: Int16
    @NSManaged public var interest: Double
    @NSManaged public var name: String?
    @NSManaged public var payTime: Int16
    @NSManaged public var purchaseTime: Int16

}
