//
//  AssetEntity+CoreDataProperties.swift
//  financeCal
//
//  Created by IkegamiYuki on 2016/11/06.
//  Copyright © 2016 IkegamiYuki. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension AssetEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AssetEntity> {
        return NSFetchRequest<AssetEntity>(entityName: "AssetEntity");
    }

    @NSManaged public var assetID: Int16
    @NSManaged public var balance: Double
    @NSManaged public var interest: Double
    @NSManaged public var time: Int16
    @NSManaged public var kind: AccountEntity?

}
