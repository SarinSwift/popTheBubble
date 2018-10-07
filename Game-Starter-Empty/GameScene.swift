//
//  GameScene.swift
//  Game-Starter-Empty
//
//  Created by mitchell hudson on 9/13/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    
    func setupScoreLabel() {
        scoreLabel.position = CGPoint(x: (view?.bounds.width)! / 4, y: (view?.bounds.height)! / 1.1)
        addChild(scoreLabel)
        
    }
    
  
    override func didMove(to view: SKView) {
        // Called when the scene has been displayed
        
        let action = SKAction.run {
            self.createSquareBottom()
        }
        
        let wait = SKAction.wait(forDuration: 1)
        let seqOfWait = SKAction.sequence([wait, action])
        let repeating = SKAction.repeatForever(seqOfWait)
        
        self.run(repeating)
        
        setupScoreLabel()

    }
    
  
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    
    func createSquareBottom() {
        let size = CGSize(width: 60, height: 60)
        let square = Box(name: "square", color: .cyan, size: size)//SKSpriteNode(texture: nil, color: .cyan, size: size)
        
        square.position.x = CGFloat(arc4random_uniform(UInt32((view?.bounds.width)!)))
        square.position.y = 0
        
        
        let moveUp = SKAction.moveBy(x: 0, y: (view?.bounds.height)!, duration: 2)
        let deleteNode = SKAction.removeFromParent()
        let scoreAction = SKAction.run {
            self.updateScore(with: -1)
        }
        let seq = SKAction.sequence([moveUp, deleteNode, scoreAction])
        
        square.name = "square"
        addChild(square)
        square.run(seq)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let node = atPoint(location)
            
            if node.name == "square" {
                node.removeFromParent()
                updateScore(with: 1)
            }
            
        }
    }
    
    private func updateScore(with newValue: Int) {
        score += newValue
        scoreLabel.text = "Score: \(score)"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func createSquare(positionX: CGFloat, positionY: CGFloat) {
        let size = CGSize(width: 60, height: 60)
        let square = SKSpriteNode(texture: nil, color: .cyan, size: size)
        
        if let view = self.view {
            square.position.x = view.bounds.width / positionX
            square.position.y = view.bounds.height / positionY
        }
        
        addChild(square)
    }
    
 
    

}
