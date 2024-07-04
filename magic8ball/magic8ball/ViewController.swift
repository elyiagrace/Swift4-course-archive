//
//  ViewController.swift
//  magic8ball
//
//  Created by Ellia Morse on 9/28/18.
//  Copyright © 2018 Ellia Morse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5", ]
    var randomBallNumber : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newBallImage()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func newBallImage(){
        randomBallNumber = Int(arc4random_uniform(4))
        imageView.image = UIImage(named : ballArray[randomBallNumber])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        newBallImage()
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            newBallImage()
            
            
        }
        
    
}


}
