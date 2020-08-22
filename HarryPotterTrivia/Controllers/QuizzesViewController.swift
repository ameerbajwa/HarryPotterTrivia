//
//  QuizzesViewController.swift
//  HarryPotterTrivia
//
//  Created by Ameer Bajwa on 8/22/20.
//  Copyright © 2020 Ameer Bajwa. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackground()
        self.navigationItem.title = "Quizzes"
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.tintColor = .clear
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
