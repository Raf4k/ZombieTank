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

@property (nonatomic, strong) NSTimer *respawnMonsterTimer;
@property (nonatomic, strong) NSTimer *dashZombiesTimer;
@property (nonatomic, strong) SKScene *parentScene;
@property (nonatomic, assign) int spawnNumber;

@end

@implementation StageOne

- (void)createMonstersFromScene:(SKScene *)scene{
    self.viewModel.speed = 0.3;
    self.viewModel.monsterSpeed = 40;
    self.viewModel.maxChargingLevel = 2;
    self.parentScene = scene;
    self.spawnNumber = 0;
    self.respawnMonsterTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(spawnMonsters) userInfo:nil repeats:YES];
    self.dashZombiesTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(dashZombies) userInfo:nil repeats:YES];
}

- (void)arrayWithMonsters{
   
   self.viewModel.arrayWithMonsters = [[NSArray alloc]initWithObjects:spriteNameEnemyZombie, spriteNameEnemyGhost, nil];
}

- (void)spawnMonsters{
    self.spawnNumber++;
    Zombie *zombie = [Zombie zombieSpriteNode];
    zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageOne];
    [self.parentScene addChild:zombie];
            
    if (self.spawnNumber == 40) {
        [self.respawnMonsterTimer invalidate];
        [self.dashZombiesTimer invalidate];
        [AppEngine defaultEngine].goToNextLevel = YES;
    }
}

- (void)dashZombies{
    [Zombie dashZombieFromParentScene:self.parentScene];
}

@end
