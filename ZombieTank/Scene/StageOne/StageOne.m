//
//  StageOne.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StageOne.h"
#import "Zombie.h"
#import "Utilities.h"
@interface StageOne()

@property (nonatomic, strong) NSTimer *respawnZombiesTimer;
@property (nonatomic, strong) SKScene *parentScene;
@property (nonatomic, assign) int spawnNumber;
@end
@implementation StageOne

- (void)createZombieFromScene:(SKScene *)scene{
    
    self.parentScene = scene;
    self.spawnNumber = 0;

    self.respawnZombiesTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(spawnZombie) userInfo:nil repeats:YES];
}

- (void)spawnZombie{
    self.spawnNumber++;
    Zombie *zombie = (Zombie *)[Zombie zombieSpriteNode];

    zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:@"SpawnStageOne"];
    zombie.zPosition = 5;
    [self.parentScene addChild:zombie];
    
    if (self.spawnNumber == 20) {
        [self.respawnZombiesTimer invalidate];
    }
}

@end
