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
        
        assignBackgroundImage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
