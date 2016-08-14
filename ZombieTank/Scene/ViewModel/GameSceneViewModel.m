//
//  GameSceneViewModel.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "GameSceneViewModel.h"

#define speedRotation 0.5;
@interface GameSceneViewModel()
@property (nonatomic, assign) CGFloat lastAngle;

@end
@implementation GameSceneViewModel

- (double)calculateRadiusAndDurationTimeFromTouchLocation:(CGPoint)positionInScene spriteNode:(SKSpriteNode *)spriteNode{
    double dx = spriteNode.position.x - positionInScene.x;
    double dy = spriteNode.position.y - positionInScene.y;
    double angle = atan2(dx, dy) + M_PI_2;
    self.speed = 1;
    double firstValue;
    double secondValue;
    
    if (angle > 4) {
        double rest = (int)angle + 1 - angle;
        angle =( 1 + rest) * -1.2;
    }else if (angle > 3){
        double rest = (int)angle + 1 - angle;
        angle = (2 + rest + 0.1) * -1.05;
    }

    if (angle * -1 > 3.14) {
        angle = 3;
    }
    
    if (self.lastAngle > angle) {
        firstValue = self.lastAngle;
        secondValue = angle;
    }else{
        firstValue = angle;
        secondValue = self.lastAngle;
    }
    
    if (firstValue - secondValue < 1.3) {
        self.speed = 0.3;
    }else if (firstValue - secondValue < 2){
        self.speed = 0.5;
    }

    self.lastAngle = angle;
    return -angle;
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

- (NSString *)setBangSpriteImage{
    
    if (self.lastAngle <= -1.5) {
        return @"bang_2_left";
    }else if (self.lastAngle >= 1.5) {
        return @"bang_2_left";
    }else if (self.lastAngle >= -1.5) {
        return @"bang_2_right";
    }else{
        return @"";
    }
}

@end
