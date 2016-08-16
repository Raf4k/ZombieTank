//
//  StageFour.m
//  ZombieTank
//
//  Created by Euvic on 16.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StageFour.h"
#import "Zombie.h"
#import "Ghost.h"
#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"

@interface StageFour()

@property (nonatomic, strong) NSTimer *respawnMonsterTimer;
@property (nonatomic, strong) SKScene *parentScene;
@property (nonatomic, assign) int spawnNumber;

@end

@implementation StageFour

- (void)createMonstersFromScene:(SKScene *)scene{
    
    self.parentScene = scene;
    self.spawnNumber = 0;
    
    self.respawnMonsterTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(spawnMonsters) userInfo:nil repeats:YES];
}

- (void)spawnMonsters{
    self.spawnNumber++;
    Zombie *zombie = [Zombie zombieSpriteNode];
    
    zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageFour];
    [self.parentScene addChild:zombie];
    
    Ghost *ghost = [Ghost ghostSpriteNode];
    
    ghost.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageFour];
    [self.parentScene addChild:ghost];
    
    if (self.spawnNumber == 20) {
        [AppEngine defaultEngine].goToNextLevel = YES;
        
        [self.respawnMonsterTimer invalidate];
    }
}

@end

