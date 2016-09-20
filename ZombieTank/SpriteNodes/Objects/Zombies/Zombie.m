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
    zombie.physicsBody.collisionBitMask = sprite2Category;
    zombie.physicsBody.affectedByGravity = NO;
    zombie.zPosition = 3;
    
    return zombie;
}

+ (void)dashZmobie:(Zombie *)zombie{
     int rand = arc4random() % 4;
    
    switch (rand) {
        case 0:
             [zombie runAction:[SKAction moveByX:100 y:0 duration:0.3]];
            break;
        case 1:
            [zombie runAction:[SKAction moveByX:-100 y:0 duration:0.3]];
            break;
        case 2:
            [zombie runAction:[SKAction moveByX:0 y:100 duration:0.3]];
            break;
        case 3:
            [zombie runAction:[SKAction moveByX:0 y:-100 duration:0.3]];
            break;
        default:
            break;
    }
}

+ (void)dashZombieFromParentScene:(SKScene *)parentScene{
    int visibleZombies = 0;
    NSMutableArray *arrayWithZombies = [NSMutableArray new];
    for (SKSpriteNode *node in parentScene.children) {
        if ([node.name isEqualToString:spriteNameEnemyZombie]) {
            visibleZombies++;
            [arrayWithZombies addObject:node];
        }
    }
    if (arrayWithZombies.count > 1) {
        int rand = arc4random() % visibleZombies;
        
        Zombie *selectedZombie = arrayWithZombies[rand];
        [Zombie dashZmobie:selectedZombie];
    }

}



@end
