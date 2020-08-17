//
//  HomePageViewController.swift
//  HarryPotterTrivia
//
//  Created by Ameer Bajwa on 8/8/20.
//  Copyright © 2020 Ameer Bajwa. All rights reserved.
//

import UIKit
import RealmSwift

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        var harrypotterQuizSection = QuizSection()
        harrypotterQuizSection.name = "Harry Potter"
        
        try! realm.write {
            realm.add(harrypotterQuizSection)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
