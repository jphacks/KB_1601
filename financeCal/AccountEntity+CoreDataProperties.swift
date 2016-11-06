//
//  AccountEntity+CoreDataProperties.swift
//  financeCal
//
//  Created by IkegamiYuki on 2016/11/06.
//  Copyright © 2016 IkegamiYuki. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension AccountEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountEntity> {
        return NSFetchRequest<AccountEntity>(entityName: "AccountEntity");
    }

    @NSManaged public var accID: Int16
    @NSManaged public var kind: Int16
    @NSManaged public var name: String?
    @NSManaged public var assetRelarion: NSSet?
    @NSManaged public var debtRelation: NSSet?
    @NSManaged public var jobRelation: NSSet?

}

// MARK: Generated accessors for assetRelarion
extension AccountEntity {

    @objc(addAssetRelarionObject:)
    @NSManaged public func addToAssetRelarion(_ value: AssetEntity)

    @objc(removeAssetRelarionObject:)
    @NSManaged public func removeFromAssetRelarion(_ value: AssetEntity)

    @objc(addAssetRelarion:)
    @NSManaged public func addToAssetRelarion(_ values: NSSet)

    @objc(removeAssetRelarion:)
    @NSManaged public func removeFromAssetRelarion(_ values: NSSet)

}

// MARK: Generated accessors for debtRelation
extension AccountEntity {

    @objc(addDebtRelationObject:)
    @NSManaged public func addToDebtRelation(_ value: DebtEntity)

    @objc(removeDebtRelationObject:)
    @NSManaged public func removeFromDebtRelation(_ value: DebtEntity)

    @objc(addDebtRelation:)
    @NSManaged public func addToDebtRelation(_ values: NSSet)

    @objc(removeDebtRelation:)
    @NSManaged public func removeFromDebtRelation(_ values: NSSet)

}

// MARK: Generated accessors for jobRelation
extension AccountEntity {

    @objc(addJobRelationObject:)
    @NSManaged public func addToJobRelation(_ value: JobEntity)

    @objc(removeJobRelationObject:)
    @NSManaged public func removeFromJobRelation(_ value: JobEntity)

    @objc(addJobRelation:)
    @NSManaged public func addToJobRelation(_ values: NSSet)

    @objc(removeJobRelation:)
    @NSManaged public func removeFromJobRelation(_ values: NSSet)

}
