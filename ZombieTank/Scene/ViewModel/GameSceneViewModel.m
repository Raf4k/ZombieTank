//
//  GameSceneViewModel.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "GameSceneViewModel.h"

#define speedRotation 0.5;

@implementation GameSceneViewModel

- (void)calculateRadiusAndDurationTimeFromTouchLocation:(CGPoint)touchLocation spriteNode:(SKSpriteNode *)spriteNode{

    float deltaY = touchLocation.y - spriteNode.position.y;
    float deltaX = touchLocation.x - spriteNode.position.x;
    float moveBydegrees = atan2(deltaY, deltaX) * 180 / 3.14159265359;
    
    // convert degrees to radians
     self.moveByRadius = moveBydegrees * M_PI / 180;
    
    float myFloat0 = 0;
    if(self.moveByRadius < 0) {
        myFloat0 = fabs(self.moveByRadius);
    } else {
        myFloat0 = self.moveByRadius;
    }
    
    float myFloat1 = 0;
    if(spriteNode.zRotation < 0) {
        myFloat1 = fabs(spriteNode.zRotation);
    } else {
        myFloat1 = spriteNode.zRotation;
    }
    
    self.duration = fabs(myFloat0 - myFloat1);
    if (self.duration < 0.1) {
        self.duration = 0.4;
    }
    
    self.duration = self.duration - speedRotation;
}

- (void)updateEnemyPosition:(NSArray *)children basePosition:(CGPoint)position enemyName:(NSString *)enemyName{
    for (SKNode *zombie in children) {
        if ([zombie.name isEqualToString:enemyName]) {
            CGPoint currentPosition = zombie.position;
            double angle = atan2(currentPosition.y - position.y, (currentPosition.x - position.x) + M_PI);
            
            CGFloat velX = 40 * cos(angle);
            CGFloat velY = 40 * sin(angle);
            
            zombie.physicsBody.velocity = CGVectorMake(-velX, -velY);
        }
    }
}
@end
