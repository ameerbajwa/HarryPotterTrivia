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
    var questionNumber: Int = 1
    var quizName: String?
    var quiz = Questions()
    var quizQuestions: [[String:Any]]?
    var phoneWidth: CGFloat?
    
    let parchmentImage = UIImage(named: "CroppedParchmentRollImage")
    var questionImageView: UIImageView?
    let questionLabel = UILabel()
    
    var choiceAButton = UIButton()
    var choiceBButton = UIButton()
    var choiceCButton = UIButton()
    var choiceDButton = UIButton()
    
    var nextButton = UIButton()
    var backButton = UIButton()
    
    var users_answers: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        phoneWidth = self.view.bounds.size.width
        print(quizName)
        
        settingQuestionScreen()
        settingUpQuestions()
        setQuestion()
        // Do any additional setup after loading the view.
    }
    
    func settingQuestionScreen() {
        questionImageView = UIImageView(image: parchmentImage)
        questionImageView?.frame = CGRect(x: 20.0, y: 100.0, width: phoneWidth!-40.0, height: 350.0)
        
        settingUpChoiceButtons(button: choiceAButton, y_position: 500.0)
        settingUpChoiceButtons(button: choiceBButton, y_position: 580.0)
        settingUpChoiceButtons(button: choiceCButton, y_position: 660.0)
        settingUpChoiceButtons(button: choiceDButton, y_position: 740.0)
        
        nextButton.frame = CGRect(x: view.bounds.size.width-80, y: view.bounds.size.height-70, width: 60, height: 50)
        backButton.frame = CGRect(x: 20, y: view.bounds.size.height-70, width: 60, height: 50)
        nextButton.layer.cornerRadius = 5
        backButton.layer.cornerRadius = 5
        nextButton.backgroundColor = UIColor(red: 255/255, green: 226/255, blue: 168/255, alpha: 1.0)
        backButton.backgroundColor = UIColor(red: 255/255, green: 226/255, blue: 168/255, alpha: 1.0)
        nextButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backQuestion), for: .touchUpInside)
        
        self.view.addSubview(questionImageView!)
    }
    
    func settingUpChoiceButtons(button: UIButton, y_position: Double) {
        button.frame = CGRect(x: 20.0, y: y_position, width: Double(phoneWidth!)-40.0, height: 50.0)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 255/255, green: 226/255, blue: 168/255, alpha: 1.0)
        button.addTarget(self, action: #selector(answerQuestion), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func settingUpQuestions() {
        switch quizName {
        case "Charms":
            quizQuestions = quiz.charms_questions
        case "Magical Plants":
            quizQuestions = quiz.magical_plants_questions
        case "Potions":
            quizQuestions = quiz.potions_questions
        case "Curses/Countercurses":
            quizQuestions = quiz.curses_countercurses_questions
        case "Jinxes/Hexes/Miscanellous Spells":
            quizQuestions = quiz.jinxes_hexes_miscellaneous_spells_questions
        case "Transfiguration Spells":
            quizQuestions = quiz.transfiguration_spells_questions
        default:
            break
        }
    }
    
    func setQuestion() {
        while questionNumber < quizQuestions!.count {
            questionLabel.text = quizQuestions?[questionNumber-1]["question"] as? String
            choiceAButton.titleLabel?.text = quizQuestions?[questionNumber-1]["choice_A"] as? String
            choiceBButton.titleLabel?.text = quizQuestions?[questionNumber-1]["choice_B"] as? String
            choiceCButton.titleLabel?.text = quizQuestions?[questionNumber-1]["choice_C"] as? String
            choiceDButton.titleLabel?.text = quizQuestions?[questionNumber-1]["choice_D"] as? String
        }
    }
    
    @objc func answerQuestion(_ sender: UIButton) {
        switch sender {
        case choiceAButton:
            users_answers.append("A")
            choiceAButton.backgroundColor = UIColor.white
        case choiceBButton:
            users_answers.append("B")
            choiceBButton.backgroundColor = UIColor.white
        case choiceCButton:
            users_answers.append("C")
            choiceCButton.backgroundColor = UIColor.white
        case choiceDButton:
            users_answers.append("D")
            choiceDButton.backgroundColor = UIColor.white
        default:
            break
        }
        
    }
    
    @objc func nextQuestion() {
        questionNumber += 1
        setQuestion()
    }
    
    @objc func backQuestion() {
        questionNumber -= 1
        setQuestion()
        
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
