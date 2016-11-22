//
//  StagesParent.h
//  ZombieTank
//
//  Created by Rafal Kampa on 19.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameSceneViewModel.h"
@protocol StagesParentDelegate
- (void)showLevelLabel:(int)level customTextLabel:(NSString *)textLabel;
- (void)bossWasHit:(int)health maxHealth:(int)maxHealth;
@end
@interface StagesParent : SKScene
@property (nonatomic, weak) id <StagesParentDelegate> parentSceneDelegate;
@property (nonatomic, strong)GameSceneViewModel *viewModel;

@property (nonatomic, assign) int spawnNumber;
@property (nonatomic, assign) int waveMaxSpawnNumber;
@property (nonatomic, assign) int wavesNumber;
@property (nonatomic, assign) float respawnSpeed;

@property (nonatomic, strong) SKScene *parentScene;

@property (nonatomic, strong) NSTimer *monsterSkillsTimer;
@property (nonatomic, strong) NSTimer *respawnMonsterTimer;
@property (nonatomic, strong) NSTimer *waitingWaveTimer;
@property (nonatomic, strong) NSString *customTextLabel;

- (void)arrayWithMonsters;
- (void)spawnMonsters;
- (void)monsterSkills;
- (void)waitingWave;
- (void)waitingWaveAdditionalOptions;

- (void)respawnMonstersTimer:(float)time;
- (void)monsterSkillsTimer:(float)time;
- (void)waitingWaveTimer:(float)time;

- (void)wavesNumberToEndLevel:(int)wavesNumber;

- (void)setBasePosition;
- (void)createMonstersFromScene:(SKScene *)scene;
- (void)moveByX:(CGFloat)x byY:(CGFloat)y byAngle:(CGFloat)angle;
- (void)setRifleSpeed:(float)rifleSpeed monstersSpeed:(int)monstersSpeed chargingLevel:(int)chargingLevel shootingPower:(int)power;
@end
