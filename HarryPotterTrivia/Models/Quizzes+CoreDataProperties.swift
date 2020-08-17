//
//  Quizzes+CoreDataProperties.swift
//  
//
//  Created by Ameer Bajwa on 8/16/20.
//
//

import Foundation
import CoreData


extension Quizzes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quizzes> {
        return NSFetchRequest<Quizzes>(entityName: "Quizzes")
    }

    @NSManaged public var quizName: String?

}
