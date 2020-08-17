//
//  Questions+CoreDataProperties.swift
//  
//
//  Created by Ameer Bajwa on 8/16/20.
//
//

import Foundation
import CoreData


extension Questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questions> {
        return NSFetchRequest<Questions>(entityName: "Questions")
    }

    @NSManaged public var quizName: String?
    @NSManaged public var question: String?
    @NSManaged public var choiceA: String?
    @NSManaged public var choiceB: String?
    @NSManaged public var choiceC: String?
    @NSManaged public var choiceD: String?
    @NSManaged public var correctAnswer: String?

}
