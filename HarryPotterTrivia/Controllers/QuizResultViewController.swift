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
    var goldBackgroundColor: UIColor = UIColor(red: 255/255, green: 226/255, blue: 168/255, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        
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
        let scoreLabel = UILabel()
        scoreLabel.text = "Quiz Score: \(score)/\(quizQuestions?.count)"
        scoreLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 18.0)
        scoreLabel.textColor = goldBackgroundColor
        scoreLabel.textAlignment = .center
        scoreLabel.numberOfLines = 2
        
        self.view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50.0).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let frame = UIImage(named: "frame")
        
        let frameView = UIImageView()
        frameView.image = frame
        self.view.addSubview(frameView)
        
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 100.0).isActive = true
        frameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50.0).isActive = true
        frameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50.0).isActive = true
                
        var resultImageString: String = ""
        let scoreMessage = UILabel()
        
        if percentage < 0.4 {
            resultImageString = "snapeScore0_3"
            scoreMessage.text = Messages.BAD_SCORE_MSG
        } else if percentage < 0.7 {
            resultImageString = "hermonieScore4_6"
            scoreMessage.text = Messages.DECENT_SCORE_MSG
        } else {
            resultImageString = "mcgonagallScore7_10"
            scoreMessage.text = Messages.WELL_DONE_SCORE_MSG
        }
        
        let resultImage = UIImageView()
        resultImage.image = UIImage(named: resultImageString)
        frameView.addSubview(resultImage)
        
        resultImage.translatesAutoresizingMaskIntoConstraints = false
        resultImage.topAnchor.constraint(equalTo: frameView.topAnchor, constant: 30.0).isActive = true
        resultImage.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 15.0).isActive = true
        resultImage.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -15.0).isActive = true
        resultImage.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -15.0).isActive = true
        frameView.bringSubviewToFront(resultImage)
        
        scoreMessage.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 16.0)
        scoreMessage.textColor = goldBackgroundColor
        scoreMessage.numberOfLines = 0
        scoreMessage.textAlignment = .center
        
        self.view.addSubview(scoreMessage)
        scoreMessage.translatesAutoresizingMaskIntoConstraints = false
        scoreMessage.topAnchor.constraint(equalTo: frameView.bottomAnchor, constant: 50.0).isActive = true
        scoreMessage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        scoreMessage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        
        let backButton = UIButton()
        backButton.setTitle("Back to Quizzes", for: .normal)
        backButton.setTitleColor(UIColor.black, for: .normal)
        backButton.backgroundColor = goldBackgroundColor
        backButton.layer.cornerRadius = 5.0
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        self.view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20.0).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
    }
    
    @objc func backButtonPressed() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "unwindToQuizzesScreen", sender: nil)
        }
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
