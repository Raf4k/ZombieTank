//
//  Utilities.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Utilities.h"
#import "Defines.h"


@implementation Utilities

+ (CGPoint)positionOfRespawnPlaceFromNodesArray:(NSArray *)nodesArray respawnName:(NSString *)respawnName{
    
    int numberOfRespawns = 0;
    
    for (SKNode *node in nodesArray) {
        if ([node.name isEqualToString:respawnName]) {
            numberOfRespawns ++;
        }
    }
    
    int randomNumber = arc4random() % numberOfRespawns;
    randomNumber++;
    numberOfRespawns = 0;
    
    for (SKNode *node in nodesArray) {
        if ([node.name isEqualToString:respawnName]) {
            numberOfRespawns ++;
            if (numberOfRespawns == randomNumber) {
                return node.position;
                break;
            }
        }
    }
    
    return CGPointMake(0, 0);
}

+ (SKPhysicsJointFixed *)jointPinBodyA:(SKPhysicsBody *)bodyA toBodyB:(SKPhysicsBody *)bodyB atPosition:(CGPoint)position{
    return [SKPhysicsJointFixed jointWithBodyA:bodyA bodyB:bodyB anchor:position];
}

+ (SKAction *)fadeInFadeOutAction{
    return [SKAction sequence:@[
                             [SKAction fadeInWithDuration:0.2],
                             [SKAction waitForDuration:0.08],
                             [SKAction fadeOutWithDuration:0.2]
                             ]];
}

+ (void)createPhysicBodyWithoutContactDetection:(SKSpriteNode *)sprite{
    sprite.physicsBody.categoryBitMask = 0;
    sprite.physicsBody.contactTestBitMask = 0;
}

+ (void)createSpriteNode:(SKSpriteNode *)spriteNode withName:(NSString *)name size:(CGSize)size{
    spriteNode.name = name;
    spriteNode.size = size;
    spriteNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNode.size];
    spriteNode.physicsBody.allowsRotation = NO;
    spriteNode.physicsBody.usesPreciseCollisionDetection = YES;
    spriteNode.physicsBody.collisionBitMask = 0;
    spriteNode.physicsBody.categoryBitMask = sprite3Category;
    spriteNode.physicsBody.contactTestBitMask = sprite2Category;
    spriteNode.physicsBody.affectedByGravity = NO;
    spriteNode.zPosition = 3;
}


@end
