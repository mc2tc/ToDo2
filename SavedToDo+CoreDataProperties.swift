//
//  SavedToDo+CoreDataProperties.swift
//  ToDo2
//
//  Created by Martin Clifford on 11/28/16.
//  Copyright © 2016 Martin Clifford. All rights reserved.
//

import Foundation
import CoreData


extension SavedToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedToDo> {
        return NSFetchRequest<SavedToDo>(entityName: "SavedToDo");
    }

    @NSManaged public var verb: String?
    @NSManaged public var task: String?
    @NSManaged public var category: String?
    @NSManaged public var effort: String?
    @NSManaged public var reward: String?
    @NSManaged public var emotion: String?
    @NSManaged public var expires: String?
    @NSManaged public var verbNum: Int
    @NSManaged public var categoryNum: Int
    @NSManaged public var effortNum: Int
    @NSManaged public var rewardNum: Int
    @NSManaged public var emotionNum: Int
    @NSManaged public var expiresNum: Int
    @NSManaged public var sortNum: Int

}
