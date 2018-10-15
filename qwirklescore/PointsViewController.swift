//
//  PointsViewController.swift
//  qwirklescore
//
//  Created by Owen Richards on 15/10/2018.
//  Copyright © 2018 Owen Garfield. All rights reserved.
//

import UIKit

var roundNum = 1

var turnNum = 0

var scoreArray = [Array<Any>]()

var firstRoundArray = [Int]()

class PointsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var pointsScored: UILabel!
    
    @IBOutlet weak var pointsStepper: UIStepper!
    
    @IBOutlet weak var whoGoesLabel: UILabel!
    
    @IBAction func pointStepperChange(_ sender: Any) {
        
        pointsScored.text = String(Int(pointsStepper.value))
        
    }
    @IBAction func qwirkleScored(_ sender: UIButton) {
        
        pointsStepper.value += 12
        pointsScored.text = String(Int(pointsStepper.value))
    }
    
    // POINTS ADDED
    @IBAction func addPointsPressed(_ sender: UIButton) {
        
        if roundNum == 1 {
        
            //Only use picker for the first round!
            
            let currentPlayerIndex : Int = playerPicker.selectedRow(inComponent: 0)
        
            firstRoundArray.append(currentPlayerIndex)
        } else {
            
            let currentPlayerIndex : Int = firstRoundArray[turnNum]
            
        }
        //What happens when the user submits points
        
        //Use conditional to determine if it's a new round or not
        if turnNum < playerCount {
        
            turnNum += 1
           

        }else{
            
            print("End of round \(roundNum) and onto round \(roundNum + 1)")
            roundNum += 1
            turnNum = 0

        }
        
    
//        scoreArray.append([roundNum,currentPlayerIndex,pointsStepper.value])
//        let debugStatement = "In round \(roundNum), \(playerArray[currentPlayerIndex]) scored \(pointsStepper.value) points"
//        print(debugStatement)
        print(playerArray)
        print(firstRoundArray)
        print(scoreArray)
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
        
        //Reset points stepper
        pointsStepper.value = 0
        
        
        
        //Show which round it is
        roundLabel.text = "ROUND " + String(roundNum)
        
        //Reset points label
        pointsScored.text = String(pointsStepper.value)
        
        if roundNum > 1 {
            
            //Show whose turn it is
            let personWhoseGoItIs = playerArray[firstRoundArray[turnNum]]
            whoGoesLabel.text = "It's \(personWhoseGoItIs)'s go!"
            playerPicker.removeFromSuperview()
            
        } else {
            
            
            //Adjust the label to show which player's next
            whoGoesLabel.text = "Who is player " + String(turnNum + 1) + "?"
            
            
        }
        
    }

}
