//
//  ViewController.swift
//  qwirklescore
//
//  Created by Owen Richards on 15/10/2018.
//  Copyright © 2018 Owen Garfield. All rights reserved.
//

import UIKit

var playerArray = [String]()
var playerCount = 0

class SecondViewController: UIViewController {

    @IBOutlet weak var playerNameText: UITextField!
 @IBOutlet weak var beginButton: UIButton!
    @IBAction func addPlayerPressed(_ sender: UIButton) {
        
        //Check for text in the textbox
        
        if playerNameText.text != nil  {
            
         let player = Player()
            player.name = playerNameText.text!
            
            
            
        //Add player to array
        playerArray.append(playerNameText.text!)
           
            
        //Tally up how many have been named
        playerCount += 1
            
        //Reset the textfield
        playerNameText.text = ""
            
        //Log for debug
            
           
        }
        
       updateUI()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a ni
        beginButton.isEnabled = false
    }
    
    func updateUI() {
        
        if playerCount > 1 {
            
            beginButton.isEnabled = true
            
        }
        
    }
    
}
