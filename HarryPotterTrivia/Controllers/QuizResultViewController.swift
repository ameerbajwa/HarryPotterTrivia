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
    var quizQuestions: [[String:String]]?
    
    var usersScore: Int = 0
    var usersScorePercentage: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<quizQuestions!.count {
            if usersAnswers![index] == quizQuestions![index]["correct_answer"] {
                usersScore += 1
            }
        }
        
        usersScorePercentage = CGFloat(usersScore)/CGFloat(quizQuestions!.count)
        settingUpResultPage(score: usersScore, percentage: usersScorePercentage)
        
        // Do any additional setup after loading the view.
    }
    
    func settingUpResultPage(score: Int, percentage: CGFloat) {
        let frame = UIImage(named: "frame")
        
        let frameView = UIImageView()
        frameView.image = frame
        self.view.addSubview(frameView)
        
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150.0).isActive = true
        frameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 75.0).isActive = true
        frameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -75.0).isActive = true
                
        var resultImageString: String = ""
        
        if percentage < 0.4 {
            resultImageString = "snapeScore0_3"
        } else if percentage < 0.7 {
            resultImageString = "hermonieScore4_6"
        } else {
            resultImageString = "mcgonagallScore7_10"
        }
        
        let resultImage = UIImageView()
        resultImage.image = UIImage(named: resultImageString)
        frameView.addSubview(resultImage)
        
        
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
