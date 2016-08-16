//
//  StageFive.m
//  ZombieTank
//
//  Created by Euvic on 16.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StageFive.h"
#import "Zombie.h"
#import "Ghost.h"
#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"

@interface StageFive()

@property (nonatomic, strong) NSTimer *respawnMonsterTimer;
@property (nonatomic, strong) SKScene *parentScene;
@property (nonatomic, assign) int spawnNumber;

@end

@implementation StageFive

- (void)createMonstersFromScene:(SKScene *)scene{
    
    self.parentScene = scene;
    self.spawnNumber = 0;
    
    self.respawnMonsterTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(spawnMonsters) userInfo:nil repeats:YES];
}

- (void)spawnMonsters{
    self.spawnNumber++;
    int rand = arc4random() % 1;
    Zombie *zombie = [Zombie zombieSpriteNode];
    Ghost *ghost = [Ghost ghostSpriteNode];
    switch (rand) {
        case 0:
            zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageFive];
            [self.parentScene addChild:zombie];
            break;
        case 1:
           ghost.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageFive];
            break;
        default:
            NSLog(@"difult");
            break;
        }

    if (self.spawnNumber == 20) {
        [AppEngine defaultEngine].goToNextLevel = YES;
        
        [self.respawnMonsterTimer invalidate];
    }
}

@end