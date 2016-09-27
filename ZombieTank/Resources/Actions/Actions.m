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

+ (SKAction *)fadeInFadeOutActionForLabels{
    return [SKAction sequence:@[
                                [SKAction fadeInWithDuration:1],
                                [SKAction waitForDuration:2],
                                [SKAction fadeOutWithDuration:1]
                                ]];
}

+ (SKAction *)fadeOutAndFadeInWithchangingPosition:(CGPoint)position{
    return [SKAction sequence:@[
                                [SKAction fadeOutWithDuration:0.5],
                                [SKAction moveTo:position duration:0.2],
                                [SKAction fadeInWithDuration:0.5]
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

+ (void)shakeScreenFor:(int)numberOfShakes withIntensity:(CGVector)intensity andDuration:(CGFloat)duration scene:(SKScene *)scene{
    UIView *sceneView = scene.view;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:(duration/numberOfShakes)];
    [animation setRepeatCount:numberOfShakes];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint: CGPointMake([sceneView center].x - intensity.dx, [sceneView center].y - intensity.dy)]];
    [animation setToValue:[NSValue valueWithCGPoint: CGPointMake([sceneView center].x + intensity.dx, [sceneView center].y + intensity.dy)]];
    [[sceneView layer] addAnimation:animation forKey:@"position"];
}

@end
