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
#import "BossHorsePutin.h"
#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"
#import "Actions.h"
#import "GameScene.h"
#import "SKSpriteNode+Health.h"

@interface StageFour() <CollisionDelegate>
@property (nonatomic, strong) NSTimer *communistZombieTimer;
@property (nonatomic, strong) NSTimer *dashBoss;
@property (nonatomic, strong) BossHorsePutin *horsePutin;
@property (nonatomic, assign) BOOL stopBossActions;

@end

@implementation StageFour

- (void)createMonstersFromScene:(SKScene *)scene{
    self.parentScene = scene;
    [(GameScene *)self.parentScene setCollisionDelegate:self];
    self.waveMaxSpawnNumber = 1;
    self.spawnNumber = 0;
    self.viewModel.bossLevel = YES;
    [self setBasePosition];
    [self setRifleSpeed:0.2 monstersSpeed:45 chargingLevel:2 shootingPower:0];
    [self respawnMonstersTimer:1];
    [self monsterSkillsTimer:0.8];
 
}

- (void)arrayWithMonsters{
    self.viewModel.arrayWithMonsters = @[spriteNameEnemyNotMoving, spriteNameEnemyZombie];
}

- (void)spawnMonsters{
    self.horsePutin = [BossHorsePutin bossHorsePutinSpriteNode];
    self.horsePutin.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageFour];
    [self.parentScene addChild:self.horsePutin];
    [self.parentSceneDelegate bossWasHit:self.horsePutin.maxHealth maxHealth:self.horsePutin.maxHealth];
    self.communistZombieTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(bossMonsters) userInfo:nil repeats:YES];
    [self.respawnMonsterTimer invalidate];
}

- (void)collisionNodeA:(SKSpriteNode *)nodeA nodeB:(SKSpriteNode *)nodeB{
  if (nodeB.name == spriteNameEnemyNotMoving || nodeA.name == spriteNameEnemyNotMoving){
        self.horsePutin.physicsBody.categoryBitMask = spriteDissapearCategory;
      self.stopBossActions = YES;
      [self.horsePutin removeAllActions];
        [self.horsePutin runAction:[Actions fadeOutAndFadeInWithchangingPosition:[Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageFour]]completion:^{
            self.horsePutin.physicsBody.categoryBitMask = sprite2Category;
            self.stopBossActions = NO;
        }];
    }
}

- (void)shieldCollisionWithNode:(SKSpriteNode *)node{
    if ([node.name isEqualToString:spriteNameEnemyNotMoving]) {
        self.stopBossActions =  YES;
        self.horsePutin.physicsBody.categoryBitMask = spriteDissapearCategory;
        [self.horsePutin removeAllActions];
        [self.horsePutin runAction:[Actions fadeOutAndFadeInWithchangingPosition:[Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageFour]]completion:^{
            self.horsePutin.physicsBody.categoryBitMask = sprite2Category;
            self.stopBossActions = NO;
        }];

        self.horsePutin.health--;
        [self.parentSceneDelegate bossWasHit:self.horsePutin.health maxHealth:self.horsePutin.maxHealth];
        if (self.horsePutin.health <= 0){
            [self endingLevel];
        }
    }
}

- (void)endingLevel{
    for (int i = 0; i < self.parentScene.children.count; i++) {
        if ([self.parentScene.children[i].name isEqualToString:spriteNameEnemyZombie]){
            [self.parentScene.children[i] removeFromParent];
            [self.horsePutin removeFromParent];
            [self.respawnMonsterTimer invalidate];
            [self.monsterSkillsTimer invalidate];
            [self.communistZombieTimer invalidate];
        }
    }
     [AppEngine defaultEngine].goToNextLevel = YES;
}

- (void)monsterSkills{
    [Zombie dashZombieFromParentScene:self.parentScene];
    int rand = arc4random() % 6;
    if (rand == 3 && !self.stopBossActions) {
        [self.horsePutin runAction:[SKAction moveTo:[self.viewModel tankPositionFromScene:self.parentScene] duration:3.5]];
    }
}

- (void)bossMonsters{
    Zombie *zombie = [Zombie zombieSpriteNode];
    [zombie setHealth:0];
    zombie.position = [Utilities positionOfRespawnPlaceFromNodesArray:self.children respawnName:spawnStageFour];
    [self.parentScene addChild:zombie];
}

@end

