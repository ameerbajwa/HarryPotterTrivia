//
//  Quiz+CoreDataProperties.swift
//  
//
//  Created by Ameer Bajwa on 8/16/20.
//
//

import Foundation
import CoreData


extension Quiz {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quiz> {
        return NSFetchRequest<Quiz>(entityName: "Quiz")
    }

    @NSManaged public var quizName: String?

}
