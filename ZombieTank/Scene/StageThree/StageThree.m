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
    self.spawnNumber = 0;
    [self setBasePosition];
    
    [self moveByX:0 byY:1200 byAngle:0];
    [self setRifleSpeed:0.3 monstersSpeed:50 chargingLevel:2];
    [self respawnMonstersTimer:0.5];
    [self monsterSkillsTimer:0.5];
}

- (void)arrayWithMonsters{
    self.viewModel.arrayWithMonsters = [[NSArray alloc]initWithObjects:spriteNameEnemyDragon, spriteNameEnemyfireBall, nil];
}

- (void)spawnMonsters{
    Dragon *dragon = [Dragon dragonSpriteNode];
    dragon.position = [Utilities positionOfRespawnWithoutRandomizePlaceFromNodesArray:self.children respawnName:spawnStageThree number:self.spawnNumber];
    self.spawnNumber++;
    [self.parentScene addChild:dragon];
    
    if (self.spawnNumber == 12) {
        [self.respawnMonsterTimer invalidate];
        
        
        [AppEngine defaultEngine].goToNextLevel = YES;
    }
}

- (void)monsterSkills{
    [Dragon fireBallFromParentScene:self.parentScene];
}

@end
