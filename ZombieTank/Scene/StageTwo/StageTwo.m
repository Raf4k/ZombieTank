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

@property (nonatomic, strong) NSTimer *respawnMonsterTimer;
@property (nonatomic, strong) SKScene *parentScene;
@property (nonatomic, strong) NSTimer *dissapearGhostTimer;
@property (nonatomic, assign) int spawnNumber;

@end

@implementation StageTwo

- (void)createMonstersFromScene:(SKScene *)scene{
    [self setBasePosition];
    self.parentScene = scene;
    self.spawnNumber = 0;
    self.viewModel.speed = 0.3;
    self.viewModel.monsterSpeed = 40;
    self.viewModel.maxChargingLevel = 2;
    
    self.respawnMonsterTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(spawnMonsters) userInfo:nil repeats:YES];
    self.dissapearGhostTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(disapearGhost) userInfo:nil repeats:YES];
}

- (void)setBasePosition{
    [AppEngine defaultEngine].baseYPosition = [AppEngine defaultEngine].baseYPosition + 1200;
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
            NSLog(@"difult");
            break;
    }
    
    if (self.spawnNumber == 30) {
        [self.respawnMonsterTimer invalidate];
        [self.dissapearGhostTimer invalidate];
        [AppEngine defaultEngine].goToNextLevel = YES;
    }
}

- (void)disapearGhost{
    [Ghost dissapearGhostsFromparentScene:self.parentScene];
}

@end
