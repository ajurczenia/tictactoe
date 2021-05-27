//
//  ViewController3.swift
//  Games.Jurczenia
//
//  Created by period6 on 5/17/21.
//

import UIKit

class ViewController3: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var paddle1: UIView!
    
    @IBOutlet weak var paddle2: UIView!
    
    @IBOutlet weak var ball: UIView!
    
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var paddleDynamicBehavior: UIDynamicItemBehavior!
    var ballDynamicBehavior: UIDynamicItemBehavior!
    var paddle2DynamicBehavior: UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.layer.masksToBounds = true
        ball.layer.cornerRadius = 15
    }
   
    @IBAction func startButton(_ sender: Any) {
        dynamicBehaviors()
       
    }
    @IBAction func paddle1Action(_ sender: UIPanGestureRecognizer) {
        paddle1.center = CGPoint(x: sender.location(in: view).x, y: paddle1.center.y)
            dynamicBehaviors()
    }
    @IBAction func paddle2Action(_ sender: UIPanGestureRecognizer) {
        paddle2.center = CGPoint(x: sender.location(in: view).x, y: paddle2.center.y)
            dynamicBehaviors()
    }
    
    
    func dynamicBehaviors() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.active = true
        pushBehavior.pushDirection = CGVector(dx: 0.6, dy: 0.7)
        pushBehavior.magnitude = 0.7
        dynamicAnimator.addBehavior(pushBehavior)

        
        collisionBehavior = UICollisionBehavior(items: [paddle1, ball])
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
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddle1])
        paddleDynamicBehavior.density = 1000.0
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        paddle2DynamicBehavior = UIDynamicItemBehavior(items: [paddle2])
        paddle2DynamicBehavior.density = 1000.0
        paddle2DynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
}


}
