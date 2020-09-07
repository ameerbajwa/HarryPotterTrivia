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
    var quizScrollView = UIScrollView()
    var quizPageControl = UIPageControl()
    
    var numberOfPages: Int = 0
    var quizStartIndex: Int = 0
    var quizEndIndex: Int = 5
    var page: Int = 1
    
    var views: [UIView] = []
    var stackViews: [UIStackView] = []
    var quizButtons: [UIButton] = []
    
    let parchmentImage = UIImage(named: Constants.CROPPED_PARCHMENT_ROLL_IMAGE)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(HarryPotterQuizNames.names)
        numberOfPages = Int((Double(HarryPotterQuizNames.names.count)/6.0).rounded(.up))
        quizPageControl.numberOfPages = numberOfPages
        print(numberOfPages)
        
        assignBackground()
        assignMessage()
        
        self.view.addSubview(quizScrollView)
        self.view.addSubview(quizPageControl)
        
        quizPageControl.translatesAutoresizingMaskIntoConstraints = false
        quizPageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50.0).isActive = true
        quizPageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50.0).isActive = true
        quizPageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50.0).isActive = true
        quizPageControl.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        quizScrollView.translatesAutoresizingMaskIntoConstraints = false
        quizScrollView.isPagingEnabled = true
        quizScrollView.isScrollEnabled = true
        quizScrollView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40.0).isActive = true
        quizScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        quizScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        quizScrollView.bottomAnchor.constraint(equalTo: quizPageControl.topAnchor).isActive = true
        quizScrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(numberOfPages), height: self.view.frame.height-340.0)
//        quizScrollView.frame = CGRect(x: 0, y: 240.0, width: self.view.frame.width, height: self.view.frame.height-340.0)
        print(quizScrollView.contentSize)
        
        for _ in 1...numberOfPages {
            views.append(UIView())
        }

        for quizIndex in 0..<HarryPotterQuizNames.names.count {
            quizButtons.append(UIButton())
            if quizIndex % 2 == 0 {
                stackViews.append(UIStackView())
            }
        }

        assignQuizzes()

    }
    
    func assignBackground() {
        let backgroundImage = UIImage(named: Constants.HARRY_POTTER_HOGWARTS_LIBRARY_IMAGE)
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        imageView.center = view.center
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func assignMessage() {
        // let message = UILabel(frame: CGRect(x: 20, y: 100, width: view.bounds.size.width-40, height: 100))
        messageLabel.text = Messages.QUIZ_PAGE_INSTRUCTIONS_MESSAGE
        messageLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 20)
        messageLabel.textColor = UIColor.white
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.view.addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0).isActive = true
        messageLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
    }
    
    func assignQuizzes() {
        
//        var stackViewStartIndex: Int = 0
//        var stackViewEndIndex: Int = 3
//
//        var quizButtonStartIndex: Int = 0
//        var quizButtonEndIndex: Int = 2
        
        for quizViewIndex in 0..<views.count {
            
//            if quizViewIndex == 0 {
//                views[quizViewIndex].backgroundColor = UIColor.red
//            } else {
//                views[quizViewIndex].backgroundColor = UIColor.blue
//            }
            
            quizScrollView.addSubview(views[quizViewIndex])
            views[quizViewIndex].translatesAutoresizingMaskIntoConstraints = false
            views[quizViewIndex].leadingAnchor.constraint(equalTo: quizScrollView.leadingAnchor, constant: self.view.frame.width*CGFloat(quizViewIndex)).isActive = true
//            quizView.trailingAnchor.constraint(equalTo: quizScrollView.trailingAnchor).isActive = true
            views[quizViewIndex].widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            views[quizViewIndex].topAnchor.constraint(equalTo: quizScrollView.topAnchor).isActive = true
            views[quizViewIndex].bottomAnchor.constraint(equalTo: quizScrollView.bottomAnchor).isActive = true
            print(self.view.frame.width*CGFloat(quizViewIndex))
            
            // TESTING
            let label = UILabel()
            label.text = HarryPotterQuizNames.names[quizViewIndex]
            label.textColor = UIColor.red
            label.textAlignment = .center

            views[quizViewIndex].addSubview(label)
            print(label.text)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.leadingAnchor.constraint(equalTo: views[quizViewIndex].leadingAnchor, constant: 100.0).isActive = true
            label.trailingAnchor.constraint(equalTo: views[quizViewIndex].trailingAnchor, constant: -100.0).isActive = true
            label.topAnchor.constraint(equalTo: views[quizViewIndex].topAnchor, constant: 200.0).isActive = true
            // TESTING
            
//            for stackViewIndex in stackViewStartIndex..<stackViewEndIndex {
//                print("stackview number \(stackViewIndex)")
//                settingUpStackViews(stackView: stackViews[stackViewIndex], qView: quizView)
//
//                if stackViewIndex == stackViewStartIndex {
//                    stackViews[stackViewIndex].topAnchor.constraint(equalTo: quizView.topAnchor).isActive = true
//                } else if stackViewIndex == stackViewStartIndex + 1 {
//                    stackViews[stackViewIndex].topAnchor.constraint(equalTo: stackViews[stackViewIndex-1].bottomAnchor, constant: 40.0).isActive = true
//                } else if stackViewIndex == stackViewStartIndex + 2 {
//                    stackViews[stackViewIndex].topAnchor.constraint(equalTo: stackViews[stackViewIndex-2].bottomAnchor, constant: 40.0).isActive = true
//                }
//
//                for quiz_index in quizButtonStartIndex..<quizButtonEndIndex {
//                    print("quiz number \(quiz_index)")
//                    quizButtons[quiz_index].setBackgroundImage(parchmentImage, for: .normal)
//                    quizButtons[quiz_index].setTitle("\(HarryPotterQuizNames.names[quiz_index])", for: .normal)
//                    quizButtons[quiz_index].titleLabel?.numberOfLines = 0
//                    quizButtons[quiz_index].titleLabel?.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 15)
//                    quizButtons[quiz_index].setTitleColor(UIColor.black, for: .normal)
//                    quizButtons[quiz_index].addTarget(self, action: #selector(quizSelected(_ :)), for: .touchUpInside)
//                    stackViews[stackViewIndex].addArrangedSubview(quizButtons[quiz_index])
//                    quizButtons[quiz_index].translatesAutoresizingMaskIntoConstraints = false
//                    quizButtons[quiz_index].widthAnchor.constraint(equalToConstant: 110.0).isActive = true
//                }
//
//                addingExtraViewIfNeeded(stackView: stackViews[stackViewIndex])
//
//                quizButtonStartIndex += 2
//                quizButtonEndIndex += 2
//
//                if quizButtonEndIndex > HarryPotterQuizNames.names.count {
//                    quizButtonEndIndex = HarryPotterQuizNames.names.count
//                }
//
//            }
            
//            stackViewStartIndex += 3
//            stackViewEndIndex += 3
//
//            if stackViewEndIndex > stackViews.count {
//                stackViewEndIndex = stackViews.count
//            }
        }
        
    }
    
    func settingUpStackViews(stackView: UIStackView, qView: UIView) {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 60.0
        stackView.distribution = .fillEqually
        
        qView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: qView.leadingAnchor, constant: 40.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: qView.trailingAnchor, constant: -40.0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
    }
    
    func addingExtraViewIfNeeded(stackView: UIStackView) {
        if stackView.subviews.count == 1 {
            let extraSpace = UIView()
            stackView.addArrangedSubview(extraSpace)
            extraSpace.translatesAutoresizingMaskIntoConstraints = false
            extraSpace.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
            
        }
    }
    
    func settingLabels(index: Int) {

    }
    
    @objc func quizSelected(_ sender: UIButton) {
        quizName = sender.titleLabel?.text
        print(quizName)
//        self.performSegue(withIdentifier: "takingQuizSegue", sender: nil)
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
