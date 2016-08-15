//
//  Zombie.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Zombie.h"
#import "Defines.h"

@implementation Zombie
+ (Zombie *)zombieSpriteNode{
    Zombie *zombie = (Zombie *)[SKSpriteNode spriteNodeWithImageNamed:@"zombie"];
    zombie.name = @"zombie";
    zombie.size = CGSizeMake(40, 70);
    zombie.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:zombie.size];
    zombie.physicsBody.allowsRotation = NO;
    zombie.physicsBody.usesPreciseCollisionDetection = YES;
    
    zombie.physicsBody.categoryBitMask = sprite2Category;
    zombie.physicsBody.contactTestBitMask = sprite2Category;
    zombie.physicsBody.affectedByGravity = NO;
    zombie.zPosition = 3;
    
    return zombie;
}

@end
