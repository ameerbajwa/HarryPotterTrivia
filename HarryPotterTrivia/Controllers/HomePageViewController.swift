//
//  HomePageViewController.swift
//  HarryPotterTrivia
//
//  Created by Ameer Bajwa on 8/8/20.
//  Copyright © 2020 Ameer Bajwa. All rights reserved.
//

import UIKit
import CoreData

class HomePageViewController: UIViewController {
    
    var titleLabel = UILabel()
    var messageLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackgroundImage()
        assignTitle()
        assignMessage()
        assignButton()
    }
    
    func assignBackgroundImage(){
        let background = UIImage(named: Constants.HARRY_POTTER_BACKGROUND_IMAGE)

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func assignTitle() {
        
        // let titleLabel = UILabel() (frame: CGRect(x: 100.0, y: 100.0, width: view.bounds.size.width-200.0, height: 100.0))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 25.0)
        titleLabel.textColor = UIColor.white
        titleLabel.text = Constants.HARRY_POTTER_TRIVIA_TITLE
        
        self.view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100.0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -100.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    func assignMessage() {
        // let messageLabel = UILabel() (frame: CGRect(x: 50.0, y: 300.0, width: view.bounds.size.width-100.0, height: 200.0))
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont(name: Constants.HARRY_POTTER_FONT, size: 20.0)
        messageLabel.textAlignment = .center
        messageLabel.textColor = UIColor.white
        messageLabel.text = Messages.WELCOME_PAGE_MESSAGE
        
        self.view.addSubview(messageLabel)

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50.0).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50.0).isActive = true
        messageLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 100.0).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func assignButton() {
        let continueButton = UIButton() // (frame: CGRect(x: 100.0, y: Double(view.bounds.size.height)-100.0, width: Double(view.bounds.size.width)-200.0, height: 50.0))
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        continueButton.setTitle(Constants.CONTINUE, for: .normal)
        continueButton.setTitleColor(UIColor.systemYellow, for: .normal)
        continueButton.backgroundColor = UIColor.systemPurple
        continueButton.layer.cornerRadius = 5.0
        
        self.view.addSubview(continueButton)
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100.0).isActive = true
        continueButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -100.0).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100.0).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @objc func continueButtonPressed() {
        self.performSegue(withIdentifier: "quizzesSegue", sender: nil)
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
