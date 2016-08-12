//
//  GameSceneViewModel.h
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameSceneViewModel : NSObject
@property (nonatomic, assign) CGFloat moveByRadius;
@property (nonatomic, assign) CGFloat duration;

- (void)calculateRadiusAndDurationTimeFromTouchLocation:(CGPoint)touchLocation spriteNode:(SKSpriteNode *)spriteNode;

@end
