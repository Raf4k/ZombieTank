//
//  Dragon.m
//  ZombieTank
//
//  Created by Rafal Kampa on 20.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Dragon.h"
#import "ShootingBall.h"
#import "Defines.h"
#import "SKSpriteNode+Health.h"

@implementation Dragon
+ (Dragon *)dragonSpriteNode{
    Dragon *dragon = (Dragon *)[SKSpriteNode spriteNodeWithImageNamed:@"dragon"];
    dragon.name = spriteNameEnemyNotMoving;
    dragon.size = CGSizeMake(40, 70);
    dragon.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:dragon.size];
    dragon.physicsBody.allowsRotation = NO;
    dragon.physicsBody.usesPreciseCollisionDetection = YES;
    
    dragon.physicsBody.categoryBitMask = sprite2Category;
    dragon.physicsBody.contactTestBitMask = sprite2Category;
    dragon.physicsBody.collisionBitMask = sprite2Category;
    dragon.physicsBody.affectedByGravity = NO;
    dragon.zPosition = 3;
    [dragon setHealth:1];
    
    return dragon;
}

+ (void)createShootingBallInScene:(SKScene *)scene dragon:(Dragon *)dragon{
    ShootingBall *ball = [ShootingBall dragonsFireBallWithStartPosition:dragon.position];
    [scene addChild:ball];
}

+ (void)fireBallFromParentScene:(SKScene *)parentScene{
    int visibleDragons = 0;
    NSMutableArray *arrayWithDragons = [NSMutableArray new];
    for (SKSpriteNode *node in parentScene.children) {
        if ([node.name isEqualToString:spriteNameEnemyNotMoving]) {
            visibleDragons++;
            [arrayWithDragons addObject:node];
        }
    }
    if (arrayWithDragons.count > 1) {
        int rand = arc4random() % visibleDragons;
        
        Dragon *selectedDragon = arrayWithDragons[rand];
        [Dragon createShootingBallInScene:parentScene dragon:selectedDragon];
    }
    
}

@end
