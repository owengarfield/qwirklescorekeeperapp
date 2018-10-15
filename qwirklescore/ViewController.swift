//
//  ViewController.swift
//  qwirklescore
//
//  Created by Owen Richards on 15/10/2018.
//  Copyright © 2018 Owen Garfield. All rights reserved.
//

import UIKit
var playerCount = 2
class ViewController: UIViewController {
    @IBAction func playerStepperChange(_ sender: UIStepper) {
        
        
        playerCount = Int(sender.value)
        numberOfPlayers.text = String(playerCount)
        print(String(playerCount) + " players")
    }
    
    @IBOutlet weak var playerStepper: UIStepper!
    @IBOutlet weak var numberOfPlayers: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a ni
        
        numberOfPlayers.text = String(playerStepper.value)
        
    }


}

