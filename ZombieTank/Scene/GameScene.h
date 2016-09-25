//
//  GameScene.h
//  ZombieTank
//

//  Copyright (c) 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@protocol GameSceneDelegate
- (void)gameOver;
- (void)chargingLevel:(int)level maxLevel:(int)maxLevel;
- (void)stopCharging;
@end
@interface GameScene : SKScene
@property (nonatomic, weak) id<GameSceneDelegate>gameSceneDelegate;
@property (nonatomic, assign) NSInteger selectedLevel;

@end
