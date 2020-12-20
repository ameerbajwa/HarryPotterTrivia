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
    var quizPageControl = UIPageControl()
    
    var numberOfPages: Int = 0
    
    var quizViews: [UIView] = []
    var quizStackViews: [UIStackView] = []
    var quizButtons: [UIButton] = []
    
    let parchmentImage = UIImage(named: Constants.CROPPED_PARCHMENT_ROLL_IMAGE)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.view.frame.height)
        
        self.navigationController?.isNavigationBarHidden = true
        
        numberOfPages = self.view.frame.height > 700.0 ? Int((Double(HarryPotterQuizNames.names.count)/6.0).rounded(.up)) : Int((Double(HarryPotterQuizNames.names.count)/4.0).rounded(.up))
        quizPageControl.numberOfPages = numberOfPages
        
        assignBackground()
        assignMessage()
        
        self.view.addSubview(quizPageControl)
        quizPageControl.translatesAutoresizingMaskIntoConstraints = false
        quizPageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50.0).isActive = true
        quizPageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50.0).isActive = true
        quizPageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50.0).isActive = true
        quizPageControl.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        quizScrollView.isPagingEnabled = true
        quizScrollView.isScrollEnabled = true
        quizScrollView.isUserInteractionEnabled = true
        quizScrollView.delegate = self
        quizScrollView.frame = CGRect(x: 0.0, y: 200.0, width: self.view.bounds.size.width, height: self.view.bounds.size.height-270.0)
        quizScrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(numberOfPages), height: self.view.frame.height-270.0)
        self.view.addSubview(quizScrollView)
        
        for _ in 1...numberOfPages {
            quizViews.append(UIView())
        }

        for quizIndex in 1...HarryPotterQuizNames.names.count {
            quizButtons.append(UIButton())
            if quizIndex % 2 == 1 {
                quizStackViews.append(UIStackView())
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
        messageLabel.text = Messages.QUIZ_PAGE_INSTRUCTIONS_MESSAGE
        messageLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 25)
        messageLabel.textColor = UIColor.white
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.view.addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0).isActive = true
        if self.view.frame.size.height > 700.0 {
            messageLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50.0).isActive = true
        } else {
            messageLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30.0).isActive = true
        }
        messageLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
    }
    
    func assignQuizzes() {
        
        var stackViewStartIndex: Int = 0
        var stackViewEndIndex: Int = 3
        stackViewEndIndex = self.view.frame.height > 700.0 ? 3: 2
        
        var quizButtonStartIndex: Int = 0
        var quizButtonEndIndex: Int = 2
        
        for quizViewIndex in 0..<quizViews.count {
            
            quizViews[quizViewIndex].frame.origin.x = quizScrollView.frame.size.width*CGFloat(quizViewIndex)
            quizViews[quizViewIndex].frame.size = quizScrollView.bounds.size
                    
            for stackViewIndex in stackViewStartIndex..<stackViewEndIndex {
                settingUpStackViews(stackView: quizStackViews[stackViewIndex], qView: quizViews[quizViewIndex])

                if stackViewIndex == stackViewStartIndex {
                    quizStackViews[stackViewIndex].topAnchor.constraint(equalTo: quizViews[quizViewIndex].topAnchor).isActive = true
                } else {
                    quizStackViews[stackViewIndex].topAnchor.constraint(equalTo: quizStackViews[stackViewIndex-1].bottomAnchor, constant: 40.0).isActive = true
                }

                for quiz_index in quizButtonStartIndex..<quizButtonEndIndex {
                    quizButtons[quiz_index].setBackgroundImage(parchmentImage, for: .normal)
                    quizButtons[quiz_index].setTitle("\(HarryPotterQuizNames.names[quiz_index])", for: .normal)
                    quizButtons[quiz_index].titleLabel?.numberOfLines = 0
                    quizButtons[quiz_index].titleLabel?.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 15)
                    quizButtons[quiz_index].setTitleColor(UIColor.black, for: .normal)
                    quizButtons[quiz_index].addTarget(self, action: #selector(quizSelected(_ :)), for: .touchUpInside)
                    
                    quizStackViews[stackViewIndex].addArrangedSubview(quizButtons[quiz_index])
                }

                addingExtraViewIfNeeded(stackView: quizStackViews[stackViewIndex])

                quizButtonStartIndex += 2
                quizButtonEndIndex += 2

                if quizButtonEndIndex > HarryPotterQuizNames.names.count {
                    quizButtonEndIndex = HarryPotterQuizNames.names.count
                }

            }
            
            stackViewStartIndex += 2
            stackViewEndIndex += 2

            if stackViewEndIndex > quizStackViews.count {
                stackViewEndIndex = quizStackViews.count
            }
            
            quizScrollView.addSubview(quizViews[quizViewIndex])

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
        stackView.heightAnchor.constraint(equalToConstant: 160.0).isActive = true
    }
    
    func addingExtraViewIfNeeded(stackView: UIStackView) {
        if stackView.subviews.count == 1 {
            let extraSpace = UIView()
            stackView.addArrangedSubview(extraSpace)
            
        }
    }
    
    func settingLabels(index: Int) {

    }
    
    @objc func quizSelected(_ sender: UIButton) {
        quizName = sender.titleLabel?.text
        print(quizName)
        self.performSegue(withIdentifier: "takingQuizSegue", sender: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var page = scrollView.contentOffset.x / scrollView.frame.size.width
        quizPageControl.currentPage = Int(page)
    }
    
    @IBAction func unwindFromQuizResultsScreen(_ seg: UIStoryboardSegue){
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
