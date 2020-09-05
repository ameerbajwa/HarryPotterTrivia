//
//  QuizzesViewController.swift
//  HarryPotterTrivia
//
//  Created by Ameer Bajwa on 8/22/20.
//  Copyright © 2020 Ameer Bajwa. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController {
    
    var HarryPotterQuizNames = Quizzes()
    var quizFrames = QuizFrames()
    var quiz: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeScreen()

        // Do any additional setup after loading the view.
        print(HarryPotterQuizNames.names)
    }
    
    func initializeScreen() {
        assignBackground()
        assignMessage()
        assignQuizzes()
    }
    
    func assignBackground() {
        let backgroundImage = UIImage(named: "HogwartsLibraryImage")
        
        var imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func assignMessage() {
        let message = UILabel(frame: CGRect(x: 20, y: 100, width: view.bounds.size.width-40, height: 100))
        message.text = "Select a quiz below to see if you paid any attention to all the magical instructions and classes while you read the books"
        message.font = UIFont(name: "Papyrus", size: 20)
        message.textColor = UIColor.white
        message.numberOfLines = 0
        self.view.addSubview(message)
    }
    
    func assignQuizzes() {
        
        for quiz_index in 0...HarryPotterQuizNames.names.count-1 {
            let parchmentImage = UIImage(named: "CroppedParchmentRollImage")
            let quizButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
            quizButton.frame = CGRect(x: quizFrames.x[quiz_index], y: quizFrames.y[quiz_index], width: 120, height: 160)
            quizButton.setBackgroundImage(parchmentImage, for: .normal)
            quizButton.setTitle("\(HarryPotterQuizNames.names[quiz_index])", for: .normal)
            quizButton.titleLabel?.numberOfLines = 0
            quizButton.titleLabel?.font = UIFont(name: "Papyrus", size: 15)
            quizButton.setTitleColor(UIColor.black, for: .normal)
            quizButton.addTarget(self, action: #selector(quizSelected(_ :)), for: .touchUpInside)
            self.view.addSubview(quizButton)
        }
        
    }
    
    @objc func quizSelected(_ sender: UIButton) {
        quiz = sender.titleLabel?.text
        self.performSegue(withIdentifier: "takingQuizSegue", sender: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "takingQuizSegue" {
            if let vc = segue.destination as? TakingQuizViewController {
                vc.quizName = quiz!
            }
        }
    }

}
