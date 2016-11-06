//
//  JobEntity+CoreDataProperties.swift
//  financeCal
//
//  Created by IkegamiYuki on 2016/11/06.
//  Copyright © 2016 IkegamiYuki. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension JobEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JobEntity> {
        return NSFetchRequest<JobEntity>(entityName: "JobEntity");
    }

    @NSManaged public var freqency: Int16
    @NSManaged public var jobID: Int16
    @NSManaged public var salary: Int16
    @NSManaged public var kind: AccountEntity?

}
