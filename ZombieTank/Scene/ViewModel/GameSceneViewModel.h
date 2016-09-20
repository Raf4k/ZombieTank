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
@property (nonatomic, assign) int chargingLevel;
@property (nonatomic, assign) int maxChargingLevel;
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) float monsterSpeed;
@property (nonatomic, strong) NSString *currentEnemyName;
@property (nonatomic, strong) NSArray *arrayWithMonsters;
@property (nonatomic, assign) CGFloat lastAngle;
@property (nonatomic, assign) int level;
@property (nonatomic, assign) BOOL bossLevel;

- (double)calculateRadiusAndDurationTimeFromTouchLocation:(CGPoint)positionInScene spriteNode:(SKSpriteNode *)spriteNode;
- (NSString *)setBangSpriteImage;

- (void)updateEnemyPosition:(NSArray *)children basePosition:(CGPoint)position enemyNames:(NSArray *)enemyName;
- (void)createCartoonLabelsWithName:(NSString *)name atPosition:(CGPoint)position inScene:(SKScene *)scene;
- (void)selectedLevel;
@end
