//
//  GameScene.h
//  ZombieTank
//

//  Copyright (c) 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "StagesParent.h"
@protocol GameSceneDelegate
- (void)gameOver;
- (void)chargingLevel:(int)level maxLevel:(int)maxLevel;
- (void)stopCharging;
- (void)bossWasHitBy:(int)health maxHealth:(int)maxHealth;
@end

@protocol CollisionDelegate
- (void)shieldCollisionWithNode:(SKSpriteNode *)node;
- (void)collisionNodeA:(SKSpriteNode *)nodeA nodeB:(SKSpriteNode *)nodeB;

@end

@interface GameScene : SKScene
@property (nonatomic, weak) id<GameSceneDelegate>gameSceneDelegate;
@property (nonatomic, weak) id<CollisionDelegate>collisionDelegate;
@property (nonatomic, assign) NSInteger selectedLevel;

@end
