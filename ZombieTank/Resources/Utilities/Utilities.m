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
    
    spriteNode.physicsBody.categoryBitMask = sprite2Category;
    spriteNode.physicsBody.contactTestBitMask = sprite1Category;
    spriteNode.physicsBody.affectedByGravity = NO;
    spriteNode.zPosition = 2;
}


@end
