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
    self.waveMaxSpawnNumber = 5;
    
    [self moveByX:0 byY:1100 byAngle:1.5];
    [self setRifleSpeed:0.3 monstersSpeed:40 chargingLevel:2];
    self.parentScene = scene;
    [self respawnMonstersTimer:0.5];
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
        [self.monsterSkillsTimer invalidate];
        [self wavesNumberToEndLevel:1];
    }
}

- (void)waitingWaveAdditionalOptions{
    self.waveMaxSpawnNumber = self.waveMaxSpawnNumber + 10;
}

- (void)monsterSkills{
    [Zombie dashZombieFromParentScene:self.parentScene];
}

@end
