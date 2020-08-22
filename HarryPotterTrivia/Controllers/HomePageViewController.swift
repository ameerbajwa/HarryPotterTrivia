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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Welcome"
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.tintColor = .clear
        
        assignBackgroundImage()
        assignLabels()
        assignButton()
    }
    
    func assignBackgroundImage(){
        let background = UIImage(named: "HarryPotterBackgroundImage")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func assignLabels() {
        let title = "Harry Potter Trivia"
        let message = "Continue to find out if you are a true wizard/witch"
        
        let titleLabel = UILabel(frame: CGRect(x: 100.0, y: 100.0, width: view.bounds.size.width-200.0, height: 100.0))
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "Papyrus", size: 25.0)
        titleLabel.textColor = UIColor.white
        titleLabel.text = title
        
        let messageLabel = UILabel(frame: CGRect(x: 50.0, y: 300.0, width: view.bounds.size.width-100.0, height: 200.0))
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont(name: "Papyrus", size: 20.0)
        messageLabel.textAlignment = .center
        messageLabel.textColor = UIColor.white
        messageLabel.text = message
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(messageLabel)
    }
    
    func assignButton() {
        let continueButton = UIButton(frame: CGRect(x: 100.0, y: Double(view.bounds.size.height)-100.0, width: Double(view.bounds.size.width)-200.0, height: 50.0))
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(UIColor.systemYellow, for: .normal)
        continueButton.backgroundColor = UIColor.systemPurple
        continueButton.layer.cornerRadius = 5.0
        
        self.view.addSubview(continueButton)
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
