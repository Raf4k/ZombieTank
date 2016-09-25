//
//  StageFour.m
//  ZombieTank
//
//  Created by Euvic on 16.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StageFour.h"
#import "Zombie.h"
#import "Ghost.h"
#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"

@interface StageFour()

@end

@implementation StageFour

- (void)createMonstersFromScene:(SKScene *)scene{
    self.parentScene = scene;
    self.waveMaxSpawnNumber = 12;
    self.spawnNumber = 0;
    self.viewModel.bossLevel = YES;
    [self setBasePosition];
    [self setRifleSpeed:0.3 monstersSpeed:70 chargingLevel:2];
    [self respawnMonstersTimer:0.5];
    [self monsterSkillsTimer:0.5];
}

- (void)arrayWithMonsters{
    self.viewModel.arrayWithMonsters = nil;
}

- (void)spawnMonsters{
   
}

@end

