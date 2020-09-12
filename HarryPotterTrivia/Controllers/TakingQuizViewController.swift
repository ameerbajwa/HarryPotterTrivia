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
    var questionImageView = UIImageView()
    let questionLabel = UILabel()
    
    var choiceAButton = UIButton()
    var choiceBButton = UIButton()
    var choiceCButton = UIButton()
    var choiceDButton = UIButton()
    var goldBackgroundColor: UIColor = UIColor(red: 255/255, green: 226/255, blue: 168/255, alpha: 1.0)
    
    var usersAnswers: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.black
        
        settingQuestionScreen()
        settingUpQuestions()
        setQuestion()
        // Do any additional setup after loading the view.
    }
    
    func settingQuestionScreen() {
        questionImageView = UIImageView(image: parchmentImage)
        self.view.addSubview(questionImageView)
//        questionImageView?.frame = CGRect(x: 20.0, y: 100.0, width: phoneWidth!-40.0, height: 350.0)
        
        questionImageView.translatesAutoresizingMaskIntoConstraints = false
        questionImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
        questionImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        questionImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        
        settingUpChoiceButtons(button: choiceAButton, topView: questionImageView)
        settingUpChoiceButtons(button: choiceBButton, topView: choiceAButton)
        settingUpChoiceButtons(button: choiceCButton, topView: choiceBButton)
        settingUpChoiceButtons(button: choiceDButton, topView: choiceCButton)
        
    }
    
    func settingUpChoiceButtons(button: UIButton, topView: UIView) {
//        button.frame = CGRect(x: 20.0, y: y_position, width: Double(phoneWidth!)-40.0, height: 50.0)
        button.layer.cornerRadius = 5
        button.backgroundColor = goldBackgroundColor
        button.addTarget(self, action: #selector(answerQuestion), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20.0).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        if button == choiceDButton {
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20.0).isActive = true
        }
        
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
        if questionNumber <= quizQuestions!.count {
            questionLabel.text = quizQuestions?[questionNumber-1]["question"] as? String
            questionLabel.textAlignment = .center
            self.questionImageView.addSubview(questionLabel)
            questionLabel.translatesAutoresizingMaskIntoConstraints = false
            questionLabel.centerXAnchor.constraint(equalTo: self.questionImageView.centerXAnchor).isActive = true
            questionLabel.centerYAnchor.constraint(equalTo: self.questionImageView.centerYAnchor).isActive = true
            choiceAButton.titleLabel?.text = quizQuestions?[questionNumber-1]["choice_A"] as? String
            choiceBButton.titleLabel?.text = quizQuestions?[questionNumber-1]["choice_B"] as? String
            choiceCButton.titleLabel?.text = quizQuestions?[questionNumber-1]["choice_C"] as? String
            choiceDButton.titleLabel?.text = quizQuestions?[questionNumber-1]["choice_D"] as? String
            
            choiceAButton.backgroundColor = goldBackgroundColor
            choiceBButton.backgroundColor = goldBackgroundColor
            choiceCButton.backgroundColor = goldBackgroundColor
            choiceDButton.backgroundColor = goldBackgroundColor
        } else {
            print(usersAnswers)
            self.performSegue(withIdentifier: "quizResultSegue", sender: nil)
        }
    }
    
    @objc func answerQuestion(_ sender: UIButton) {
        switch sender {
        case choiceAButton:
            choiceAButton.backgroundColor = UIColor.white
            usersAnswers.append("A")
            questionNumber += 1
            setQuestion()
        case choiceBButton:
            choiceBButton.backgroundColor = UIColor.white
            usersAnswers.append("B")
            questionNumber += 1
            setQuestion()
        case choiceCButton:
            choiceCButton.backgroundColor = UIColor.white
            usersAnswers.append("C")
            questionNumber += 1
            setQuestion()
        case choiceDButton:
            choiceDButton.backgroundColor = UIColor.white
            usersAnswers.append("D")
            questionNumber += 1
            setQuestion()
        default:
            break
        }
        
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizResultSegue" {
            if let vc = segue.destination as? QuizResultViewController {
                vc.userAnswers = usersAnswers
                vc.quizQuestions = quizQuestions
            }
        }
    }
    

}
