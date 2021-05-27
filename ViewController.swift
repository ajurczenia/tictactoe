//
//  ViewController.swift
//  Games.Jurczenia
//
//  Created by period6 on 4/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree:UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    
    var allLabel: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   turnLabel.text = "X"
        allLabel = [labelOne, labelTwo, labelThree, labelFour, labelFive, labelSix, labelSeven, labelEight, labelNine]
        // Do any additional setup after loading the view
        
    }
    func placeInToLabel(myLabel: UILabel) {
        if myLabel.text == "" {
            if turnLabel.text == "X"{
                myLabel.text = turnLabel.text
                turnLabel.text = "O"
            }
        
            else {
                myLabel.text = turnLabel.text
                turnLabel.text = "X"
            }
        
    }
    func checkForWinner() {
      
            if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text && labelOne.text != ""{
            checkForWinner()
            }
            if labelFour.text == labelFive.text && labelFive.text == labelSix.text && labelFour.text != ""{
            checkForWinner()
            }
            if labelSeven.text == labelEight.text && labelEight.text == labelNine.text && labelSeven.text != ""{
            checkForWinner()
            }
            if labelOne.text == labelFour.text && labelFour.text == labelSeven.text && labelOne.text != ""{
            checkForWinner()
            }
            if labelTwo.text == labelFive.text && labelFive.text == labelEight.text && labelTwo.text != ""{
            checkForWinner()
            }
            if labelThree.text == labelSix.text && labelSix.text == labelNine.text && labelThree.text != ""{
            checkForWinner()
            }
            if labelOne.text == labelFive.text && labelFive.text == labelNine.text && labelOne.text != ""{
            checkForWinner()
                
            }
            if labelThree.text == labelFive.text && labelFive.text == labelSeven.text && labelOne.text != ""{
            checkForWinner()
            }
            
            let winningAlert = UIAlertController(title: "You Won", message: "Way to go", preferredStyle: .alert)
            let newGame = UIAlertAction(title: "New Game", style: .cancel) { (action) in
            
            self.labelOne.text = ""
            self.labelTwo.text = ""
            self.labelThree.text = ""
            self.labelFour.text = ""
            self.labelFive.text = ""
            self.labelSix.text = ""
            self.labelSeven.text = ""
            self.labelEight.text = ""
            self.labelNine.text = ""
        }
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            winningAlert.addAction(newGame)
            winningAlert.addAction(cancelButton)
        
            present(winningAlert, animated: true, completion: nil)
            
        }
    }
    @IBAction func resetButton(_ sender: Any) {
        labelOne.text = ""
        labelTwo.text = ""
        labelThree.text = ""
        labelFour.text = ""
        labelFive.text = ""
        labelSix.text = ""
        labelSeven.text = ""
        labelEight.text = ""
        labelNine.text = ""
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
    let selectedPoint = sender.location(in: myView)
        for label in allLabel {
            if label.frame.contains(selectedPoint) {
                placeInToLabel(myLabel: label)
                
                print("tapped")
        }
            }
    }
}

