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
@property (nonatomic, strong) SKScene *parentScene;
@property (nonatomic, assign) int spawnNumber;

@end

@implementation StageOne

- (void)createMonstersFromScene:(SKScene *)scene{
    
    self.parentScene = scene;
    self.spawnNumber = 0;
    
    self.respawnMonsterTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(spawnMonsters) userInfo:nil repeats:YES];
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
            zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageOne];
            [self.parentScene addChild:zombie];
            break;
        case 1:
            ghost.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageOne];
             [self.parentScene addChild:ghost];
            break;
        default:
            NSLog(@"difult");
            break;
    }
    
    if (self.spawnNumber == 2) {
         [self.respawnMonsterTimer invalidate];
        [AppEngine defaultEngine].goToNextLevel = YES;
    }
}

@end
