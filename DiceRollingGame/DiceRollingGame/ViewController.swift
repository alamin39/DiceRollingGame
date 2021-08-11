//
//  ViewController.swift
//  DiceRollingGame
//
//  Created by Al-Amin on 25/2/21.
//  Copyright © 2021 Al-Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ruleLabel: UILabel!
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet weak var diceOneImage: UIImageView!
    @IBOutlet weak var diceTwoImage: UIImageView!
    @IBOutlet weak var playerOneName: UILabel!
    @IBOutlet weak var playerTwoName: UILabel!
    
    let finalScore = 30
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var firstPlayerName = ""
    var secondPlayerName = ""
    var pOneScore = 0
    var pTwoScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        ruleLabel.text = "Score at least 30 to win the match!!"
        playerOneName.text = (firstPlayerName.count == 0) ? "Player 1" : firstPlayerName
        playerTwoName.text = (secondPlayerName.count == 0) ? "Player 2" : secondPlayerName
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateResult()
    }

    @IBAction func pressRolling(_ sender: Any) {
        updateResult()
    }

    private func setScoresAndDices() {
        let one = Int(arc4random_uniform(6))
        let two = Int(arc4random_uniform(6))

        pOneScore += one + 1
        pTwoScore += two + 1
        playerOneScore.text = "\(pOneScore)"
        playerTwoScore.text = "\(pTwoScore)"

        diceOneImage.image = UIImage(named: diceArray[one])
        diceTwoImage.image = UIImage(named: diceArray[two])
    }

    private func showPopUp(name: String) {
        let alert = UIAlertController(title: name, message: "", preferredStyle: .alert)
        let playAgain = UIAlertAction(title: "Play Again", style: .default) { _ in
            self.setInitialValue()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(playAgain)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }

    private func updateResult() {
        setScoresAndDices()
        if pOneScore >= finalScore && pTwoScore >= finalScore {
            showPopUp(name: "Draw!!")
        }
        else if pOneScore >= finalScore {
            showPopUp(name: "\(playerOneName.text!) Won!!")
        }
        else if pTwoScore >= finalScore {
            showPopUp(name: "\(playerTwoName.text!) Won!!")
        }
    }

    private func setInitialValue() {
        pOneScore = 0
        pTwoScore = 0
        playerOneScore.text = "0"
        playerTwoScore.text = "0"
    }
}
