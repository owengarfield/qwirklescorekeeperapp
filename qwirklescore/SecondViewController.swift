//
//  ViewController.swift
//  qwirklescore
//
//  Created by Owen Richards on 15/10/2018.
//  Copyright © 2018 Owen Garfield. All rights reserved.
//

import UIKit

var playerArray = [String]()
var playersNamed = 0

class SecondViewController: UIViewController {

    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    @IBAction func addPlayerPressed(_ sender: UIButton) {
        
        //Check for text in the textbox
        if playerNameText.text != nil && playerArray.count < playerCount {
            
        //Add player to array
        playerArray.append(playerNameText.text!)
        
        //Tally up how many have been named
        playersNamed += 1
            
        //Reset the textfield
        playerNameText.text = ""
            
        //Log for debug
        print("\(playersNamed) out of \(playerCount) have been named")
        print(playerArray)
        
        } else {
            
                  addPlayerButton.isEnabled = false
            startGameButton.isEnabled = true
        }
        
    }
    @IBOutlet weak var playerNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a ni
        startGameButton.isEnabled = false
    }
    
    func updateUI() {
        
        
        
    }
    
}
