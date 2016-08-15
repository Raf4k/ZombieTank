//
//  Actions.m
//  ZombieTank
//
//  Created by Rafal Kampa on 15.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Actions.h"

@implementation Actions

+ (SKAction *)fadeInFadeOutAction{
    return [SKAction sequence:@[
                                [SKAction fadeInWithDuration:0.2],
                                [SKAction waitForDuration:0.08],
                                [SKAction fadeOutWithDuration:0.2]
                                ]];
}

+ (SKAction *)rotateToAngle:(CGFloat)angle andMoveByX:(CGFloat)x moveByY:(CGFloat)y{
    return [SKAction sequence:@[
                                [SKAction rotateToAngle:angle duration:2],
                                [SKAction waitForDuration:0.08],
                                [SKAction moveByX:x y:y duration:6]
                                ]];
}

+ (SKAction *)scaleFrom:(CGFloat)from to:(CGFloat)to{
    return [SKAction sequence:@[
                                [SKAction scaleYTo:to duration:2],
                                [SKAction scaleXTo:to duration:2],
                                [SKAction waitForDuration:0.08],
                                [SKAction scaleYTo:from duration:4],
                                [SKAction scaleXTo:from duration:4]
                                ]];
}

@end
