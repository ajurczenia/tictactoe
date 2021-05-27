//
//  ViewController2.swift
//  Games.Jurczenia
//
   //  Created by period6 on 4/27/21.
//

import UIKit
import AVFoundation
class ViewController2: UIViewController, UICollisionBehaviorDelegate {
     
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var paddle: UIView!
    
    @IBOutlet weak var brickOne: UIView!
    @IBOutlet weak var brickTwo: UIView!
    @IBOutlet weak var brickThree: UIView!
    @IBOutlet weak var brickFour: UIView!
    @IBOutlet weak var brickFive: UIView!
    @IBOutlet weak var brickSix: UIView!
    
   
    var bricks = [UIView]()
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var paddleDynamicBehavior: UIDynamicItemBehavior!
    var ballDynamicBehavior: UIDynamicItemBehavior!
    var bricksDynamicBehavior: UIDynamicItemBehavior!
    var brickCount = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.layer.masksToBounds = true
        ball.layer.cornerRadius = 20
        bricks = [brickOne, brickTwo, brickThree, brickFour, brickFive, brickSix]
        paddle.isHidden = true
        ball.isHidden = true
        dynamicBehaviors()
    }
    
    @IBAction func movePaddle(_ sender: UIPanGestureRecognizer) {
        paddle.center = CGPoint(x: sender.location(in: view).x, y: paddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddle)
    }
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehaviors()
        paddle.isHidden = false
        ball.isHidden = false
        sender.isHidden = true
        let sound = AVSpeechSynthesizer()
        let utter = AVSpeechUtterance(string: "Begin")
        sound.speak(utter)
    }
    func alert() {
        let losingAlert = UIAlertController(title: "Loser", message: "Try Again", preferredStyle: .alert)
        let newGame = UIAlertAction(title: "New Game", style: .default) { (action) in
    }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        losingAlert.addAction(newGame)
        losingAlert.addAction(cancelButton)
        
        present(losingAlert, animated: true, completion: nil)
}
    func alert2() {
        let winningAlert = UIAlertController(title: "You Won", message: "Way to go", preferredStyle: .alert)
        let newGame = UIAlertAction(title: "New Game", style: .default) { (action) in
            self.brickCount = 6
            self.restartButton.isHidden = false
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        winningAlert.addAction(newGame)
        winningAlert.addAction(cancelButton)
    
        present(winningAlert, animated: true, completion: nil)

    }
   
    func dynamicBehaviors(){
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.active = true
        pushBehavior.pushDirection = CGVector(dx: 0.6, dy: 0.7)
        pushBehavior.magnitude = 0.7
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [paddle, ball] + bricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.collisionDelegate = self
        
        ballDynamicBehavior = UIDynamicItemBehavior(items: [ball])
        ballDynamicBehavior.allowsRotation = false
        ballDynamicBehavior.elasticity = 1.05
        ballDynamicBehavior.friction = 0.0
        ballDynamicBehavior.resistance = 0.0
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddle])
        paddleDynamicBehavior.density = 1000.0
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        bricksDynamicBehavior = UIDynamicItemBehavior(items: bricks)
        bricksDynamicBehavior.density = 1000.0
        bricksDynamicBehavior.allowsRotation = false
        bricksDynamicBehavior.addChildBehavior(bricksDynamicBehavior)
        
        collisionBehavior.addItem(ball)
        collisionBehavior.addItem(paddle)
   
    }
 
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for wes in bricks {
            if item1.isEqual(ball) && item2.isEqual(wes) {
                wes.isHidden  = true
                collisionBehavior.removeItem(wes)
                brickCount -= 1
                print(brickCount)
            }
            if brickCount == 0{
                self.ball.isHidden = true
                self.paddle.isHidden = true
                collisionBehavior.removeItem(ball)
                alert2()
            }

        }
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > paddle.center.y {
        }

    }
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
    
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item1: UIDynamicItem, with item2: UIDynamicItem) {
        
    }
}
