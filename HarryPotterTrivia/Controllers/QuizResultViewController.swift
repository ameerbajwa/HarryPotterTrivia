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
        scoreLabel.text = "Quiz Score: \(score)/\(quizQuestions!.count)"
        scoreLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 20.0)
        scoreLabel.textColor = goldBackgroundColor
        scoreLabel.textAlignment = .center
        scoreLabel.numberOfLines = 2
        
        self.view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        if self.view.frame.size.height > 750.0 {
            scoreLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
        } else {
            scoreLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25.0).isActive = true
        }
        scoreLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                
        let frame = UIImage(named: "frame")
        
        let frameView = UIImageView()
        frameView.image = frame
        self.view.addSubview(frameView)
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 25.0).isActive = true
        frameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30.0).isActive = true
        frameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30.0).isActive = true
                
        var resultImageString: String = ""
        let scoreMessage = UILabel()
        
        if percentage < 0.4 {
            resultImageString = "snapeScore0_3"
            scoreMessage.text = Messages.BAD_SCORE_MSG
        } else if percentage < 0.8 {
            resultImageString = "hermonieScore4_6"
            scoreMessage.text = Messages.DECENT_SCORE_MSG
        } else {
            resultImageString = "mcgonagallScore7_10"
            scoreMessage.text = Messages.WELL_DONE_SCORE_MSG
        }
        
        let resultImage = UIImageView()
        resultImage.image = UIImage(named: resultImageString)
        self.view.addSubview(resultImage)
        
        resultImage.autoresizesSubviews = true
        resultImage.translatesAutoresizingMaskIntoConstraints = false
        resultImage.topAnchor.constraint(equalTo: frameView.topAnchor, constant: 45.0).isActive = true
        resultImage.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 30.0).isActive = true
        resultImage.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -30.0).isActive = true
        resultImage.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -45.0).isActive = true
        self.view.bringSubviewToFront(resultImage)
                
        scoreMessage.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 18.0)
        scoreMessage.textColor = goldBackgroundColor
        scoreMessage.numberOfLines = 0
        scoreMessage.textAlignment = .center
        
        self.view.addSubview(scoreMessage)
        scoreMessage.translatesAutoresizingMaskIntoConstraints = false
        scoreMessage.topAnchor.constraint(equalTo: frameView.bottomAnchor, constant: 25.0).isActive = true
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
        backButton.topAnchor.constraint(equalTo: scoreMessage.bottomAnchor, constant: 25.0).isActive = true
//        if self.view.frame.size.height > 700.0 {
//            backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100.0).isActive = true
//        } else {
//            backButton.topAnchor.constraint(equalTo: scoreMessage.bottomAnchor, constant: 25.0).isActive = true
//        }
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        
    }
    
    @objc func backButtonPressed() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "unwindToQuizzesScreen", sender: nil)
        }
    }
    
     func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
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
