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
    var quizQuestions = [[String:String]]()
    var randomQuizQuestions = [[String:String]]()
    
    let parchmentImage = UIImage(named: "CroppedParchmentRollImage")
    var questionImageView = UIImageView()
    let questionLabel = UILabel()
    var questionNumberLabel = UILabel()
    
    var choiceAButton = UIButton()
    var choiceBButton = UIButton()
    var choiceCButton = UIButton()
    var choiceDButton = UIButton()
    var nextButton = UIButton()
    var goldBackgroundColor: UIColor = UIColor(red: 255/255, green: 226/255, blue: 168/255, alpha: 1.0)
    
    var usersAnswers: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.black
        
        settingQuestionScreen()
        settingUpQuestions()
    }
    
    func settingQuestionScreen() {
        
        let quizNameLabel = UILabel()
        quizNameLabel.text = "\(quizName!) Quiz"
        quizNameLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 25.0)
        quizNameLabel.textAlignment = .center
        quizNameLabel.numberOfLines = 0
        quizNameLabel.textColor = goldBackgroundColor
        
        self.view.addSubview(quizNameLabel)
        quizNameLabel.translatesAutoresizingMaskIntoConstraints = false
        quizNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50.0).isActive = true
        quizNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        quizNameLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        questionNumberLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 20.0)
        questionNumberLabel.textAlignment = .center
        questionNumberLabel.textColor = goldBackgroundColor
        
        self.view.addSubview(questionNumberLabel)
        questionNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        questionNumberLabel.topAnchor.constraint(equalTo: quizNameLabel.bottomAnchor, constant: 20.0).isActive = true
        questionNumberLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        questionNumberLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        questionImageView = UIImageView(image: parchmentImage)
        self.view.addSubview(questionImageView)
        
        questionImageView.translatesAutoresizingMaskIntoConstraints = false
        questionImageView.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 20.0).isActive = true
        questionImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        questionImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        
        settingUpChoiceButtons(button: choiceAButton, topView: questionImageView)
        settingUpChoiceButtons(button: choiceBButton, topView: choiceAButton)
        settingUpChoiceButtons(button: choiceCButton, topView: choiceBButton)
        settingUpChoiceButtons(button: choiceDButton, topView: choiceCButton)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 5.0
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.backgroundColor = goldBackgroundColor
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        self.view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: choiceDButton.bottomAnchor, constant: 20.0).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100.0).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100.0).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50.0).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
    }
    
    func settingUpChoiceButtons(button: UIButton, topView: UIView) {
        button.layer.cornerRadius = 5
        button.backgroundColor = goldBackgroundColor
        button.titleLabel?.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 15.0)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(answerQuestion), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20.0).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        
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
        
        if quizQuestions.count > 10 {
            for _ in 0..<10 {
                quizQuestions.shuffle()
                randomQuizQuestions.append(quizQuestions.last!)
                quizQuestions.removeLast()
            }
        } else {
            quizQuestions.shuffle()
            randomQuizQuestions = quizQuestions
        }
        setQuestion()
    }
    
    func setQuestion() {
        
        questionNumberLabel.text = "Question #\(questionNumber)"
        questionNumberLabel.fadeTransition(1)
        
        questionLabel.text = randomQuizQuestions[questionNumber-1]["question"]
        questionLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 20.0)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0

        self.questionImageView.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.leadingAnchor.constraint(equalTo: questionImageView.leadingAnchor, constant: 30.0).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: questionImageView.trailingAnchor, constant: -30.0).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: self.questionImageView.centerXAnchor).isActive = true
        questionLabel.centerYAnchor.constraint(equalTo: self.questionImageView.centerYAnchor).isActive = true
        
        questionLabel.fadeTransition(1)
        
        if let choiceA = randomQuizQuestions[questionNumber-1]["choice_A"] {
            choiceAButton.setTitle("A. \(choiceA)", for: .normal)
            setQuestionChoiceLabel(button: choiceAButton)
        }
        if let choiceB = randomQuizQuestions[questionNumber-1]["choice_B"] {
            choiceBButton.setTitle("B. \(choiceB)", for: .normal)
            setQuestionChoiceLabel(button: choiceBButton)
        }
        if let choiceC = randomQuizQuestions[questionNumber-1]["choice_C"] {
            choiceCButton.setTitle("C. \(choiceC)", for: .normal)
            setQuestionChoiceLabel(button: choiceCButton)
        }
        if let choiceD = randomQuizQuestions[questionNumber-1]["choice_D"] {
            choiceDButton.setTitle("D. \(choiceD)", for: .normal)
            setQuestionChoiceLabel(button: choiceDButton)
        }
        
        choiceAButton.backgroundColor = goldBackgroundColor
        choiceBButton.backgroundColor = goldBackgroundColor
        choiceCButton.backgroundColor = goldBackgroundColor
        choiceDButton.backgroundColor = goldBackgroundColor
        
    }
    
    func setQuestionChoiceLabel(button: UIButton) {
        button.titleLabel?.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 14.0)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.85
        button.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10.0).isActive = true
        button.titleLabel?.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -10.0).isActive = true
        button.titleLabel?.topAnchor.constraint(equalTo: button.topAnchor, constant: 10.0).isActive = true
        button.titleLabel?.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10.0).isActive = true
        button.titleLabel?.fadeTransition(1)
    }
    
    @objc func answerQuestion(_ sender: UIButton) {
        switch sender {
        case choiceAButton:
            choiceAButton.backgroundColor = UIColor.white
            choiceBButton.backgroundColor = goldBackgroundColor
            choiceCButton.backgroundColor = goldBackgroundColor
            choiceDButton.backgroundColor = goldBackgroundColor
        case choiceBButton:
            choiceBButton.backgroundColor = UIColor.white
            choiceAButton.backgroundColor = goldBackgroundColor
            choiceCButton.backgroundColor = goldBackgroundColor
            choiceDButton.backgroundColor = goldBackgroundColor
        case choiceCButton:
            choiceCButton.backgroundColor = UIColor.white
            choiceAButton.backgroundColor = goldBackgroundColor
            choiceBButton.backgroundColor = goldBackgroundColor
            choiceDButton.backgroundColor = goldBackgroundColor
        case choiceDButton:
            choiceDButton.backgroundColor = UIColor.white
            choiceAButton.backgroundColor = goldBackgroundColor
            choiceBButton.backgroundColor = goldBackgroundColor
            choiceCButton.backgroundColor = goldBackgroundColor
        default:
            break
        }
        
    }
    
    @objc func nextButtonPressed(_ sender: UIButton) {
        if choiceAButton.backgroundColor == UIColor.white {
            usersAnswers.append("A")
        } else if choiceBButton.backgroundColor == UIColor.white {
            usersAnswers.append("B")
        } else if choiceCButton.backgroundColor == UIColor.white {
            usersAnswers.append("C")
        } else if choiceDButton.backgroundColor == UIColor.white {
            usersAnswers.append("D")
        } else {
            usersAnswers.append("")
        }
        questionNumber += 1

        if questionNumber < randomQuizQuestions.count {
            setQuestion()
        } else if questionNumber == randomQuizQuestions.count {
            nextButton.setTitle("Finish", for: .normal)
            setQuestion()
        } else {
            print(usersAnswers)
            self.performSegue(withIdentifier: "quizResultSegue", sender: nil)
        }
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizResultSegue" {
            if let vc = segue.destination as? QuizResultViewController {
                vc.usersAnswers = usersAnswers
                vc.quizQuestions = randomQuizQuestions
            }
        }
    }
    

}

extension UILabel {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
