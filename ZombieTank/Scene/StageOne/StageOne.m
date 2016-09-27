//
//  StageOne.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StageOne.h"
#import "Zombie.h"
#import "Ghost.h"
#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"

@interface StageOne()
@end

@implementation StageOne

- (void)createMonstersFromScene:(SKScene *)scene{
    self.waveMaxSpawnNumber = 10;
    self.respawnSpeed = 0.5;
    self.parentScene = scene;
    [self setRifleSpeed:0.3 monstersSpeed:45 chargingLevel:5 shootingPower:1];
    [self respawnMonstersTimer:self.respawnSpeed];
    [self monsterSkillsTimer:2];
}

- (void)arrayWithMonsters{
   self.viewModel.arrayWithMonsters = [[NSArray alloc]initWithObjects:spriteNameEnemyZombie, spriteNameEnemyGhost, nil];
}

- (void)spawnMonsters{
    self.spawnNumber++;
    Zombie *zombie = [Zombie zombieSpriteNode];
    zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageOne];
    [self.parentScene addChild:zombie];
            
    if (self.spawnNumber == self.waveMaxSpawnNumber) {
        [self.respawnMonsterTimer invalidate];
        [self wavesNumberToEndLevel:2];
    }
}

- (void)waitingWaveAdditionalOptions{
    self.waveMaxSpawnNumber = self.waveMaxSpawnNumber + 15;
    self.viewModel.monsterSpeed = self.viewModel.monsterSpeed + 12;
    if (self.viewModel.wavesCounter  == 1) {
        self.viewModel.monsterSpeed = 30;
        self.waveMaxSpawnNumber = 110;
        self.respawnSpeed = 0.3;
    }
}

- (void)monsterSkills{
    [Zombie dashZombieFromParentScene:self.parentScene];
}

@end
