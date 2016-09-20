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
    self.parentScene = scene;
    self.spawnNumber = 0;
    [self setBasePosition];
    [self moveByX:1200 byY:0 byAngle:0];
    [self setRifleSpeed:0.3 monstersSpeed:50 chargingLevel:2];
    [self respawnMonstersTimer:0.5];
    [self monsterSkillsTimer:2];
}

- (void)arrayWithMonsters{
    self.viewModel.arrayWithMonsters = [[NSArray alloc]initWithObjects:spriteNameEnemyZombie, spriteNameEnemyGhost, nil];
}

- (void)spawnMonsters{
    self.spawnNumber++;
    Zombie *zombie = [Zombie zombieSpriteNode];
    Ghost *ghost = [Ghost ghostSpriteNode];
    int rand = arc4random() % 2;
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
    
    if (self.spawnNumber == 10) {
        [self.respawnMonsterTimer invalidate];
        [self.monsterSkillsTimer invalidate];
        [AppEngine defaultEngine].goToNextLevel = YES;
    }
}

- (void)monsterSkills{
    [Ghost dissapearGhostsFromparentScene:self.parentScene];
    [Zombie dashZombieFromParentScene:self.parentScene];
}

@end
