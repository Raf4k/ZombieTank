//
//  FireRing.m
//  ZombieTank
//
//  Created by Rafal Kampa on 20.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "FireRing.h"
#import "Defines.h"
#import "Utilities.h"

@implementation FireRing
+ (FireRing *)fireSpriteNode{
    FireRing *fireRing = (FireRing *)[SKSpriteNode spriteNodeWithImageNamed:@"fire"];
    fireRing.name = @"fire";
    fireRing.size = CGSizeMake(250, 250);
    fireRing.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:fireRing.size];
    fireRing.physicsBody.allowsRotation = NO;
    fireRing.physicsBody.usesPreciseCollisionDetection = YES;
    
    fireRing.physicsBody.categoryBitMask = sprite3Category;
    fireRing.physicsBody.contactTestBitMask = sprite2Category | sprite3Category;
    fireRing.physicsBody.collisionBitMask = sprite2Category | sprite3Category;
    fireRing.physicsBody.affectedByGravity = NO;
    fireRing.zPosition = 5;
    
    return fireRing;
}
@end
