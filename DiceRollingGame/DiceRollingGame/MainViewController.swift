//
//  MainViewController.swift
//  DiceRollingGame
//
//  Created by Al-Amin on 25/2/21.
//  Copyright © 2021 Al-Amin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var firstPlayer: UITextField!
    @IBOutlet weak var secondPlayer: UITextField!

    @IBAction func playButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "gotoPlay", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoPlay" {
            let vc = segue.destination as! ViewController
            vc.firstPlayerName = firstPlayer.text!
            vc.secondPlayerName = secondPlayer.text!
        }
    }
}
