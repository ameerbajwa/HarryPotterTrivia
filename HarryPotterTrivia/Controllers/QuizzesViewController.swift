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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeScreen()
        
        self.navigationItem.title = "Quizzes"
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.tintColor = .clear
        self.navigationItem.hidesBackButton = true

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
        
        for quiz_name in HarryPotterQuizNames.names {
            let quizView = UIImageView()
            let parchmentImage = UIImage(named: "ParchmentScrollImage")
    //        let parchmentBackgroundColor = UIColor(patternImage: parchmentImage!)
            
    //        quizView.backgroundColor = parchmentBackgroundColor
            
            quizView.frame = CGRect(x: 40, y: 220, width: 120, height: 160)
            quizView.image = parchmentImage
            quizView.clipsToBounds = true
            self.view.addSubview(quizView)
        }
        

        
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
