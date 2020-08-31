//
//  TakingQuizViewController.swift
//  HarryPotterTrivia
//
//  Created by Ameer Bajwa on 8/27/20.
//  Copyright © 2020 Ameer Bajwa. All rights reserved.
//

import UIKit

class TakingQuizViewController: UIViewController {
    
    var timer = Timer()
    var question_number: Int = 1
    var quiz: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(quiz)

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
