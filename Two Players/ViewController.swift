//
//  ViewController.swift
//  Two Players
//
//  Created by Jennifer Joseph on 11/19/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var beginGameButton: UIButton!
    
    var player1Input = false
    var player2Input = false

    
    override func viewDidLoad() {
        // When the app starts, the cursor should automatically be placed in the text field so the user can begin text entry without having to first tap the text field. The Name: label should contain the text “Player 1:” to indicate to the user that they should enter the first player’s name.
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
        nameLabel.text! = "Player 1:"
        beginGameButton.isHidden = true
    }
    
    func bothNames() {
        //Once both player names have been entered, the app should dismiss the keyboard, disable the text field, and display a button that says "Begin Game".  The Name: label and text field should be set to an empty string.
        nameTextField.resignFirstResponder()
        nameTextField.isEnabled = false
        beginGameButton.isHidden = false
    }
    
    func updatePlayer1() {
        player1Label.text! = "Player 1: \(nameTextField.text!)"
        nameTextField.text! = ""
        nameLabel.text! = "Player 2:"
        nameTextField.becomeFirstResponder()
    }
    
    func updatePlayer2() {
        player2Label.text! = "Player 2: \(nameTextField.text!)"
        nameTextField.text! = ""
        nameLabel.text! = ""
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        //Pressing the "Done" key after typing the first name should accept the name typed, and put it in the label in the top left so it reads "Player 1: <whatever name the user entered>". Any text in the text field should be removed. The Name: label should be updated to contain the text “Player 2:” to indicate that the user should now enter the second player’s name.
        if !player1Input {
            updatePlayer1()
            player1Input = true
        } else if !player2Input {
            updatePlayer2()
            player2Input = true
            bothNames()
        }
    }
}

