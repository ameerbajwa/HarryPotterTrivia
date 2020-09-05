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
    var quizName: String?
    
    var messageLabel = UILabel()
    
    
    var firstStackView = UIStackView()
    var secondStackView = UIStackView()
    var thirdStackView = UIStackView()

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
        let backgroundImage = UIImage(named: Constants.HARRY_POTTER_HOGWARTS_LIBRARY_IMAGE)
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func assignMessage() {
        // let message = UILabel(frame: CGRect(x: 20, y: 100, width: view.bounds.size.width-40, height: 100))
        messageLabel.text = Messages.QUIZ_PAGE_INSTRUCTIONS_MESSAGE
        messageLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 20)
        messageLabel.textColor = UIColor.white
        messageLabel.numberOfLines = 0
        self.view.addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0).isActive = true
        messageLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    func assignQuizzes() {
        
        settingUpStackViews(stackView: firstStackView)
        settingUpStackViews(stackView: secondStackView)
        settingUpStackViews(stackView: thirdStackView)
        
        firstStackView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40.0).isActive = true
        secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 40.0).isActive = true
        thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 40.0).isActive = true
        
        for quiz_index in 0...HarryPotterQuizNames.names.count-1 {
            let parchmentImage = UIImage(named: Constants.CROPPED_PARCHMENT_ROLL_IMAGE)
            let quizButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
            // quizButton.frame = CGRect(x: quizFrames.x[quiz_index], y: quizFrames.y[quiz_index], width: 120, height: 160)
            quizButton.setBackgroundImage(parchmentImage, for: .normal)
            quizButton.setTitle("\(HarryPotterQuizNames.names[quiz_index])", for: .normal)
            quizButton.titleLabel?.numberOfLines = 0
            quizButton.titleLabel?.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 15)
            quizButton.setTitleColor(UIColor.black, for: .normal)
            quizButton.addTarget(self, action: #selector(quizSelected(_ :)), for: .touchUpInside)
            if quiz_index < 2 {
                firstStackView.addArrangedSubview(quizButton)
            } else if quiz_index < 4 {
                secondStackView.addArrangedSubview(quizButton)
            } else {
                thirdStackView.addArrangedSubview(quizButton)
            }
        }
        
    }
    
    func settingUpStackViews(stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40.0).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40.0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 160.0).isActive = true
    }
    
    @objc func quizSelected(_ sender: UIButton) {
        quizName = sender.titleLabel?.text
        self.performSegue(withIdentifier: "takingQuizSegue", sender: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "takingQuizSegue" {
            if let vc = segue.destination as? TakingQuizViewController {
                vc.quizName = quizName!
            }
        }
    }

}
