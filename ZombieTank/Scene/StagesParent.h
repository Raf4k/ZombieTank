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
@property (nonatomic, strong) SKScene *parentScene;
@property (nonatomic, strong) NSTimer *monsterSkillsTimer;
@property (nonatomic, strong) NSTimer *respawnMonsterTimer;

- (void)arrayWithMonsters;
- (void)spawnMonsters;
- (void)monsterSkills;

- (void)respawnMonstersTimer:(float)time;
- (void)monsterSkillsTimer:(float)time;

- (void)createMonstersFromScene:(SKScene *)scene;
- (void)moveByX:(CGFloat)x byY:(CGFloat)y byAngle:(CGFloat)angle;
- (void)setRifleSpeed:(float)rifleSpeed monstersSpeed:(int)monstersSpeed chargingLevel:(int)chargingLevel;
@end
