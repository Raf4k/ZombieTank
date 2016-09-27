//
//  BossHorsePutin.m
//  ZombieTank
//
//  Created by Rafal Kampa on 25.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "BossHorsePutin.h"
#import "Defines.h"
#import "SKSpriteNode+Health.h"

@implementation BossHorsePutin

+ (BossHorsePutin *)bossHorsePutinSpriteNode{
    BossHorsePutin *horsePutin = (BossHorsePutin *)[SKSpriteNode spriteNodeWithImageNamed:@"horsePutin"];
    horsePutin.name = spriteNameEnemyNotMoving;
    horsePutin.size = CGSizeMake(80, 140);
    horsePutin.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:horsePutin.size];
    horsePutin.physicsBody.allowsRotation = NO;
    horsePutin.physicsBody.usesPreciseCollisionDetection = YES;
    
    horsePutin.physicsBody.categoryBitMask = sprite2Category;
    horsePutin.physicsBody.contactTestBitMask = sprite2Category;
    horsePutin.physicsBody.collisionBitMask = sprite2Category;
    horsePutin.physicsBody.affectedByGravity = NO;
    horsePutin.zPosition = 3;
    horsePutin.physicsBody.mass = 1000;
    [horsePutin setMaxHealth:5];
    [horsePutin setHealth:5];
    return horsePutin;
}

@end
