//
//  ShootingBall.m
//  ZombieTank
//
//  Created by Rafal Kampa on 14.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "ShootingBall.h"
#import "Utilities.h"
#import "Defines.h"

@implementation ShootingBall

+ (ShootingBall *)shootingBallSpriteNodeWithStartPosition:(CGPoint)startPosition{
    ShootingBall *shootingBall = (ShootingBall *)[SKSpriteNode spriteNodeWithImageNamed:@"ball"];
    [Utilities createSpriteNode:shootingBall withName:@"ball" size:CGSizeMake(10, 10)];
    shootingBall.position = startPosition;
    shootingBall.physicsBody.mass = 0.4;
    return shootingBall;
}


@end