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
@property (nonatomic, strong) Zombie *zombie;
@property (nonatomic, strong) Ghost *ghost;

@end

@implementation StageOne

- (void)createMonstersFromScene:(SKScene *)scene{
    
    self.parentScene = scene;
    self.spawnNumber = 0;
    
    self.respawnMonsterTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(spawnMonsters) userInfo:nil repeats:YES];
}

- (NSArray *)arrayWithMonsters{
    NSArray *array = [[NSArray alloc]initWithObjects:self.zombie, self.ghost, nil];
    return array;
}

- (void)spawnMonsters{
    self.spawnNumber++;
    self.zombie = [Zombie zombieSpriteNode];
    self.ghost = [Ghost ghostSpriteNode];
    int rand = arc4random() % 2;
    switch (rand) {
        case 0:
            self.zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageOne];
            [self.parentScene addChild:self.zombie];
            break;
        case 1:
            self.ghost.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageOne];
            break;
        default:
            NSLog(@"difult");
            break;
    }
    
    if (self.spawnNumber == 10) {
        [AppEngine defaultEngine].goToNextLevel = YES;
        
        [self.respawnMonsterTimer invalidate];
    }
}

@end
