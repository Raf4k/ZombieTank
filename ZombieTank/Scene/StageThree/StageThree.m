//
//  StageThree.m
//  ZombieTank
//
//  Created by Euvic on 16.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StageThree.h"
#import "Dragon.h"
#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"

@interface StageThree()

@end

@implementation StageThree

- (void)createMonstersFromScene:(SKScene *)scene{
    self.parentScene = scene;
    self.waveMaxSpawnNumber = 12;
    self.spawnNumber = 0;
    [self setBasePosition];
    
    [self moveByX:0 byY:1200 byAngle:0];
    [self setRifleSpeed:0.3 monstersSpeed:55 chargingLevel:4];
    [self respawnMonstersTimer:0.5];
    [self monsterSkillsTimer:0.5];
}

- (void)arrayWithMonsters{
    self.viewModel.arrayWithMonsters = [[NSArray alloc]initWithObjects:spriteNameEnemyDragon, spriteNameEnemyfireBall, nil];
}

- (void)spawnMonsters{
    Dragon *dragon = [Dragon dragonSpriteNode];
    self.spawnNumber++;
    dragon.position = [Utilities positionOfRespawnWithoutRandomizePlaceFromNodesArray:self.children respawnName:spawnStageThree number:self.spawnNumber];
    [self.parentScene addChild:dragon];
    
    if (self.spawnNumber == self.waveMaxSpawnNumber) {
        [self.respawnMonsterTimer invalidate];
        self.viewModel.monsterSpeed = self.viewModel.monsterSpeed + 8;
        [self wavesNumberToEndLevel:3];
    }
}

- (void)monsterSkills{
    [Dragon fireBallFromParentScene:self.parentScene];
}

@end
