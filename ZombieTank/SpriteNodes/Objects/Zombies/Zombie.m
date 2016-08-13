//
//  Zombie.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie
+ (SKSpriteNode *)zombieSpriteNode{
    SKSpriteNode *zombie = [SKSpriteNode spriteNodeWithImageNamed:@"zombie"];
    zombie.name = @"zombie";
    zombie.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 30)];
    zombie.physicsBody.allowsRotation = NO;
    zombie.physicsBody.usesPreciseCollisionDetection = YES;
    zombie.physicsBody.affectedByGravity = NO;
    zombie.zPosition = 1;
    zombie.size = CGSizeMake(40, 70);
    return zombie;
}

@end
