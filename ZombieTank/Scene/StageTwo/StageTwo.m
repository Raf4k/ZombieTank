//
//  StageTwo.m
//  ZombieTank
//
//  Created by Rafal Kampa on 15.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StageTwo.h"
#import "Zombie.h"
#import "Ghost.h"
#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"

@interface StageTwo()

@end

@implementation StageTwo

- (void)createMonstersFromScene:(SKScene *)scene{
    self.waveMaxSpawnNumber = 20;
    self.parentScene = scene;
    self.respawnSpeed = 0.5;
    [self setBasePosition];
    [self setRifleSpeed:0.3 monstersSpeed:50 chargingLevel:5 shootingPower:1];
    [self respawnMonstersTimer:self.respawnSpeed];
    [self monsterSkillsTimer:2];
}

- (void)arrayWithMonsters{
    self.viewModel.arrayWithMonsters = [[NSArray alloc]initWithObjects:spriteNameEnemyZombie, spriteNameEnemyGhost, nil];
}

- (void)spawnMonsters{
    self.spawnNumber++;
    Zombie *zombie = [Zombie zombieSpriteNode];
    Ghost *ghost = [Ghost ghostSpriteNode];
    
    int rand = 0;
    
    if (self.viewModel.wavesCounter > 1) {
        rand = arc4random() % 2;
    }
    
    switch (rand) {
        case 0:
            zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageTwo];
            [self.parentScene addChild:zombie];
            break;
        case 1:
            ghost.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageTwo];
            [self.parentScene addChild:ghost];
            break;
        default:
            break;
    }
    
    if (self.spawnNumber == self.waveMaxSpawnNumber) {
        [self.respawnMonsterTimer invalidate];
        self.viewModel.monsterSpeed = self.viewModel.monsterSpeed + 8;
        [self wavesNumberToEndLevel:3];
    }
}

- (void)monsterSkills{
    [Ghost dissapearGhostsFromparentScene:self.parentScene];
    [Zombie dashZombieFromParentScene:self.parentScene];
}

- (void)waitingWaveAdditionalOptions{
    self.waveMaxSpawnNumber = self.waveMaxSpawnNumber + 15;
    self.viewModel.monsterSpeed = self.viewModel.monsterSpeed + 10;
    if (self.viewModel.wavesCounter  >= 2) {
        self.viewModel.monsterSpeed = 30;
        self.waveMaxSpawnNumber = 60;
        self.respawnSpeed = 0.28;
    }
}

@end
