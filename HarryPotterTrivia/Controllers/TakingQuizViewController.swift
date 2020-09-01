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
    var question_number: Int = 1
    var quiz: String?
    var phoneWidth: CGFloat?
    
    let parchmentImage = UIImage(named: "CroppedParchmentRollImage")
    var questionImageView: UIImageView?
    var choiceAButton = UIButton()
    var choiceBButton = UIButton()
    var choiceCButton = UIButton()
    var choiceDButton = UIButton()
    
    var users_answers: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        phoneWidth = self.view.bounds.size.width
        print(quiz)
        
        settingQuestionScreen()

        // Do any additional setup after loading the view.
    }
    
    func settingQuestionScreen() {
        questionImageView = UIImageView(image: parchmentImage)
        questionImageView?.frame = CGRect(x: 20.0, y: 100.0, width: phoneWidth!-40.0, height: 350.0)
        
        settingUpChoiceButtons(button: choiceAButton, y_position: 500.0)
        settingUpChoiceButtons(button: choiceBButton, y_position: 580.0)
        settingUpChoiceButtons(button: choiceCButton, y_position: 660.0)
        settingUpChoiceButtons(button: choiceDButton, y_position: 740.0)
        
        self.view.addSubview(questionImageView!)
    }
    
    func settingUpChoiceButtons(button: UIButton, y_position: Double) {
        button.frame = CGRect(x: 20.0, y: y_position, width: Double(phoneWidth!)-40.0, height: 50.0)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 255/255, green: 226/255, blue: 168/255, alpha: 1.0)
        self.view.addSubview(button)
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
