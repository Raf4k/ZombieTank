//
//  Utilities.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"


@implementation Utilities

+ (CGPoint)positionOfRespawnPlaceFromNodesArray:(NSArray *)nodesArray respawnName:(NSString *)respawnName{
    int baseXPosition = [AppEngine defaultEngine].baseXPosition;
    int baseYPosition = [AppEngine defaultEngine].baseYPosition;
    
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
                return CGPointMake(node.position.x + baseXPosition, node.position.y + baseYPosition);
                break;
            }
        }
    }
    
    return CGPointMake(0, 0);
}

+ (SKPhysicsJointFixed *)jointPinBodyA:(SKPhysicsBody *)bodyA toBodyB:(SKPhysicsBody *)bodyB atPosition:(CGPoint)position{
    return [SKPhysicsJointFixed jointWithBodyA:bodyA bodyB:bodyB anchor:position];
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
