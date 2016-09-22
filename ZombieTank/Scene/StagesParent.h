//
//  StagesParent.h
//  ZombieTank
//
//  Created by Rafal Kampa on 19.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameSceneViewModel.h"

@interface StagesParent : SKScene
@property (nonatomic, strong)GameSceneViewModel *viewModel;
@property (nonatomic, assign) int spawnNumber;
@property (nonatomic, assign) int wavesNumber;

@property (nonatomic, strong) SKScene *parentScene;
@property (nonatomic, strong) NSTimer *monsterSkillsTimer;
@property (nonatomic, strong) NSTimer *respawnMonsterTimer;
@property (nonatomic, strong) NSTimer *waitingWaveTimer;

- (void)arrayWithMonsters;
- (void)spawnMonsters;
- (void)monsterSkills;
- (void)waitingWave;

- (void)respawnMonstersTimer:(float)time;
- (void)monsterSkillsTimer:(float)time;
- (void)waitingWaveTimer:(float)time;

- (void)setBasePosition;
- (void)createMonstersFromScene:(SKScene *)scene;
- (void)moveByX:(CGFloat)x byY:(CGFloat)y byAngle:(CGFloat)angle;
- (void)setRifleSpeed:(float)rifleSpeed monstersSpeed:(int)monstersSpeed chargingLevel:(int)chargingLevel;
@end
