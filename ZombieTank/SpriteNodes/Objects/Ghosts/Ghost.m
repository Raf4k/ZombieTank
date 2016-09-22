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
    ghost.physicsBody.contactTestBitMask = sprite1Category;
     ghost.physicsBody.collisionBitMask = sprite1Category;
    ghost.physicsBody.affectedByGravity = NO;
    ghost.zPosition = 3;
    
    return ghost;
}

+ (void)changePhysicsBody:(Ghost *)ghost{
    if (ghost.alpha == 1) {
        ghost.physicsBody.categoryBitMask = spriteDissapearCategory;
        ghost.physicsBody.contactTestBitMask = spriteDissapearCategory;
        ghost.physicsBody.collisionBitMask = spriteDissapearCategory;
        ghost.alpha = 0.4;
    }else{
        ghost.alpha = 1;
        ghost.physicsBody.categoryBitMask = sprite2Category;
        ghost.physicsBody.contactTestBitMask = sprite2Category;
        ghost.physicsBody.collisionBitMask = sprite2Category;
    }
}

+ (void)dissapearGhostsFromparentScene:(SKScene *)parentScene{
    int visibleGhost = 0;
    NSMutableArray *arrayWithGhosts = [NSMutableArray new];
    for (SKSpriteNode *node in parentScene.children) {
        if ([node.name isEqualToString:spriteNameEnemyGhost]) {
            visibleGhost++;
            [arrayWithGhosts addObject:node];
        }
    }
    if (arrayWithGhosts.count > 1) {
        int rand = arc4random() % visibleGhost;
        
        Ghost *selectedGhost = arrayWithGhosts[rand];
        [Ghost changePhysicsBody:selectedGhost];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [Ghost changePhysicsBody:selectedGhost];
        });
    }
}

@end
