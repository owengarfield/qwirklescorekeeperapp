//
//  scoreBoardViewController.swift
//  qwirklescore
//
//  Created by Owen Richards on 15/10/2018.
//  Copyright © 2018 Owen Garfield. All rights reserved.
//

import UIKit

class scoreBoardViewController: UITableViewController, UITabBarDelegate {
    @IBOutlet var scoreBoard: UITableView!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return roundNum - 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerCount + 1
    }
    
   override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
    
    if indexPath.row == 0 {
        
        cell.textLabel?.text = "Round " + String(indexPath.section + 1)
    } else {
        
        let playerName = playerArray[firstRoundArray[indexPath.row-1]]
        let scoreThisRound = scoreArray[(indexPath.section * playerCount) + (indexPath.row - 1)][2]
        cell.textLabel?.text = "\(playerName) scored - \(scoreThisRound)"
        
    }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewDidAppear(_ animated: Bool) {
        scoreBoard.reloadData()
    }

}
