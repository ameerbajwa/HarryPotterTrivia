//
//  QuizResultViewController.swift
//  HarryPotterTrivia
//
//  Created by Ameer Bajwa on 9/12/20.
//  Copyright © 2020 Ameer Bajwa. All rights reserved.
//

import UIKit

class QuizResultViewController: UIViewController {
    
    var usersAnswers: [String]?
    var quizQuestions: [String:Any]?
    
    var usersScore: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<quizQuestions!.count {
            if usersAnswers![index] == quizQuestions!["correct_answer"] {
                usersScore += 1
            }
        }
        
        print(usersScore)

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
