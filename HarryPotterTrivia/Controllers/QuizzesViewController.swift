//
//  QuizzesViewController.swift
//  HarryPotterTrivia
//
//  Created by Ameer Bajwa on 8/22/20.
//  Copyright © 2020 Ameer Bajwa. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController, UIScrollViewDelegate {
    
    var HarryPotterQuizNames = Quizzes()
    var quizFrames = QuizFrames()
    var quizName: String?
    
    var messageLabel = UILabel()
    var quizScrollView = UIScrollView()
    
    var numberOfPages: Int = 0
    var quizStartIndex: Int = 0
    var quizEndIndex: Int = 5
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(HarryPotterQuizNames.names)
        numberOfPages = Int((Double(HarryPotterQuizNames.names.count)/6.0).rounded(.up))
        print(numberOfPages)
        
        assignBackground()
        assignMessage()
        
        quizScrollView.delegate = self
        self.view.addSubview(quizScrollView)
        quizScrollView.translatesAutoresizingMaskIntoConstraints = false
        quizScrollView.isPagingEnabled = true
        quizScrollView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40.0).isActive = true
        quizScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        quizScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        quizScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        quizScrollView.contentSize = CGSize(width: quizScrollView.frame.width * CGFloat(numberOfPages), height: quizScrollView.frame.height)
        
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
        
        while page <= numberOfPages {
            let quizView = UIView()
            self.quizScrollView.addSubview(quizView)
            quizView.translatesAutoresizingMaskIntoConstraints = false
            quizView.leftAnchor.constraint(equalTo: self.quizScrollView.leftAnchor).isActive = true
            quizView.rightAnchor.constraint(equalTo: self.quizScrollView.rightAnchor).isActive = true
            quizView.topAnchor.constraint(equalTo: self.quizScrollView.topAnchor).isActive = true
            quizView.bottomAnchor.constraint(equalTo: self.quizScrollView.bottomAnchor).isActive = true
            
            let firstStackView = UIStackView()
            let secondStackView = UIStackView()
            let thirdStackView = UIStackView()
            
            settingUpStackViews(stackView: firstStackView, qView: quizView)
            settingUpStackViews(stackView: secondStackView, qView: quizView)
            settingUpStackViews(stackView: thirdStackView, qView: quizView)
            
            firstStackView.topAnchor.constraint(equalTo: quizView.topAnchor).isActive = true
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 40.0).isActive = true
            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 40.0).isActive = true
            
            for quiz_index in quizStartIndex...quizEndIndex {
                let parchmentImage = UIImage(named: Constants.CROPPED_PARCHMENT_ROLL_IMAGE)
                let quizButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
                // quizButton.frame = CGRect(x: quizFrames.x[quiz_index], y: quizFrames.y[quiz_index], width: 120, height: 160)
                quizButton.setBackgroundImage(parchmentImage, for: .normal)
                quizButton.setTitle("\(HarryPotterQuizNames.names[quiz_index])", for: .normal)
                quizButton.titleLabel?.numberOfLines = 0
                quizButton.titleLabel?.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 15)
                quizButton.setTitleColor(UIColor.black, for: .normal)
                quizButton.addTarget(self, action: #selector(quizSelected(_ :)), for: .touchUpInside)
                if quiz_index < quizStartIndex + 2 {
                    firstStackView.addArrangedSubview(quizButton)
                } else if quiz_index < quizStartIndex + 4 {
                    secondStackView.addArrangedSubview(quizButton)
                } else {
                    thirdStackView.addArrangedSubview(quizButton)
                }
                quizButton.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
            }
            
            addingExtraViewIfNeeded(stackView: firstStackView)
            addingExtraViewIfNeeded(stackView: secondStackView)
            addingExtraViewIfNeeded(stackView: thirdStackView)
            
            page += 1
            quizStartIndex += 6
            
            if page == numberOfPages {
                quizEndIndex = HarryPotterQuizNames.names.count-1
            } else {
                quizEndIndex += 6
            }
        }
        
    }
    
    func settingUpStackViews(stackView: UIStackView, qView: UIView) {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 50.0
        stackView.distribution = .fillEqually
        
        qView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: qView.leftAnchor, constant: 40.0).isActive = true
        stackView.rightAnchor.constraint(equalTo: qView.rightAnchor, constant: -40.0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 160.0).isActive = true
    }
    
    func addingExtraViewIfNeeded(stackView: UIStackView) {
        if stackView.subviews.count == 1 {
            let extraSpace = UIView()
            stackView.addArrangedSubview(extraSpace)
            extraSpace.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
            
        }
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
