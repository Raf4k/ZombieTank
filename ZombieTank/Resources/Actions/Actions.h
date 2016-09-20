//
//  Actions.h
//  ZombieTank
//
//  Created by Rafal Kampa on 15.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Actions : NSObject

+ (SKAction *)fadeInFadeOutAction;
+ (SKAction *)rotateToAngle:(CGFloat)angle andMoveByX:(CGFloat)x moveByY:(CGFloat)y;
+ (SKAction *)scaleFrom:(CGFloat)from to:(CGFloat)to;
+ (void)shakeScreenFor:(int)numberOfShakes withIntensity:(CGVector)intensity andDuration:(CGFloat)duration scene:(SKScene *)scene;
@end
