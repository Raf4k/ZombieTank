//
//  Ghost.m
//  ZombieTank
//
//  Created by Euvic on 16.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Ghost.h"
#import "Defines.h"

@implementation Ghost
+ (Ghost *)ghostSpriteNode{
    Ghost *ghost = (Ghost *)[SKSpriteNode spriteNodeWithImageNamed:@"ghost"];
    ghost.name = @"ghost";
    ghost.size = CGSizeMake(40, 70);
    ghost.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ghost.size];
    ghost.physicsBody.allowsRotation = NO;
    ghost.physicsBody.usesPreciseCollisionDetection = YES;
    
    ghost.physicsBody.categoryBitMask = sprite2Category;
    ghost.physicsBody.contactTestBitMask = sprite2Category;
    ghost.physicsBody.affectedByGravity = NO;
    ghost.zPosition = 3;
    
    return ghost;
}
@end
