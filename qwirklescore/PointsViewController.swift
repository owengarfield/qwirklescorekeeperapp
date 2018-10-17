//
//  PointsViewController.swift
//  qwirklescore
//
//  Created by Owen Richards on 15/10/2018.
//  Copyright © 2018 Owen Garfield. All rights reserved.
//

import UIKit

var roundNum = 1
var turnNum = 1
var scoreArray = [[Int]]()
var firstRoundArray = [Int]()
var currentPlayerIndex : Int = 0
var totalArray : [[Int]] = []

func getTotals(){
    
    for scores in scoreArray {
        
        var runningTotal = 0
        
        for players in playerArray {
            
            runningTotal = runningTotal + scores[2]
            let personsScoreArray = [players,runningTotal] as! [Int]
            totalArray.append(personsScoreArray)
            
        }
        
    }
    
    print(totalArray)
}

class PointsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var pointsScored: UILabel!
    @IBOutlet weak var pointsStepper: UIStepper!
    @IBOutlet weak var whoGoesLabel: UILabel!
    
    //Increase points value
    
    @IBAction func pointStepperChange(_ sender: Any) {
        pointsScored.text = String(Int(pointsStepper.value))
    }
    
    //Increase by 12
    @IBAction func qwirkleScored(_ sender: UIButton) {
        pointsStepper.value += 12
        pointsScored.text = String(Int(pointsStepper.value))
    }
    
    // POINTS ADDED
    @IBAction func addPointsPressed(_ sender: UIButton) {
        
        if roundNum == 1 {
            
            currentPlayerIndex = playerPicker.selectedRow(inComponent: 0)
            
            firstRoundArray.append(currentPlayerIndex)
            
        } else {
            
             currentPlayerIndex = firstRoundArray[turnNum-1]
            
        }
       
        scoreArray.append([roundNum,currentPlayerIndex,Int(pointsStepper.value)])
       
        
        //Use conditional to determine if it's a new round or not
        if turnNum < playerCount {
        
            turnNum += 1
           

        }else{
            
            
            if roundNum == 1 {
                
                playerPicker.removeFromSuperview()
                
            }
            roundNum += 1
            turnNum = 1

        }
        
    
      
//        let debugStatement = "In round \(roundNum), \(playerArray[currentPlayerIndex]) scored \(pointsStepper.value) points"
//        print(debugStatement)
      
        resetUI()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return playerArray[row]
    }

    @IBOutlet weak var playerPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resetUI()
     
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func resetUI(){
        
        print("Round \(roundNum)")
        print("Turn \(roundNum)")
        print(scoreArray)
            
        getTotals()
        
        //Reset points stepper
        pointsStepper.value = 0
        
        //Show which round it is
        roundLabel.text = "ROUND " + String(roundNum)
        
        //Reset points label
        pointsScored.text = String(Int(pointsStepper.value))
        
        if roundNum > 1 {
        
            //Show whose turn it is
            let personWhoseGoItIs = playerArray[firstRoundArray[turnNum-1]]
            whoGoesLabel.text = "\(personWhoseGoItIs) it's your go!"
            
            
        } else {
            
            
            //Adjust the label to show which player's next
            whoGoesLabel.text = "Who is player " + String(turnNum) + "?"
            
            
        }
        
    }

}
