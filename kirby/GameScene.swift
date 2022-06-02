
//  GameScene

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    var ufo = SKNode()
    var test = true
   var flame = SKSpriteNode(imageNamed: "fire")
   
    override func didMove(to view: SKView)
    {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        ufo = self.childNode(withName: "ufo")!
        ufo.physicsBody?.collisionBitMask = 3
        flame.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
          flame.physicsBody?.affectedByGravity = false
          flame.physicsBody?.isDynamic = false
          flame.physicsBody?.allowsRotation = true
        flame.position = CGPoint(x: ufo.position.x, y: ufo.position.y)
       
       
        addChild(flame)

         
    }
   
    
    
    
    
//
//  func flameMove()
//    {
//    while test == true
//        {
//            flame.position = CGPoint(x: ufo.position.x, y: ufo.position.y)
//        }
//    }
    
    
    
    
    
    
    
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let location = touches.first?.location(in: self)
        let posX = ufo.position.x
        var posXJump = posX
        let posY = ufo.position.y
        var posYJump = posY
        print(location)
        
        if Int(location!.x)>0 && Int(location!.y)<(-210)
        {
            posXJump = posX+400
            posYJump = posY+700
            ufo.physicsBody?.velocity.dx = posXJump
            ufo.physicsBody?.velocity.dy = posYJump
        }
        
        else if Int(location!.x)<0 && Int(location!.y)<(-210)
        {
            posXJump = posX-400
            posYJump = posY+700
            ufo.physicsBody?.velocity.dx = posXJump
            ufo.physicsBody?.velocity.dy = posYJump
        }
    }
    
    func makeObj(time:Double, speed: Double, width:CGFloat, height:CGFloat, posX:CGFloat, posY:CGFloat )
    {
        let object = SKSpriteNode(color: UIColor.red, size: CGSize(width: width, height: height))
        object.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        object.physicsBody?.affectedByGravity = true
        object.speed = speed
        object.position.y = posY
        object.position.x = posX
        object.physicsBody?.mass = 1000000
        parent?.addChild(object)
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        flame.position = CGPoint(x: ufo.position.x, y: ufo.position.y)
    }
    
}
