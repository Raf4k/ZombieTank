//
//  StagesParent.m
//  ZombieTank
//
//  Created by Rafal Kampa on 19.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StagesParent.h"
#import "AppEngine.h"

@implementation StagesParent

- (void)arrayWithMonsters{
    //implement in child class
}

- (void)createMonstersFromScene:(SKScene *)scene{
    //implement in child class
}

- (void)spawnMonsters{
    //implement in child class
}

- (void)monsterSkills{
    //implement in child class
}

- (void)waitingWaveAdditionalOptions{
    //implement in child class
}

- (void)waitingWave{
    if (![self.viewModel areMonstersInScene:self.parentScene]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.parentSceneDelegate showLevelLabel:self.viewModel.level customTextLabel:self.customTextLabel];
            [self.waitingWaveTimer invalidate];
            self.spawnNumber = 0;
            self.wavesNumber++;
            [self respawnMonstersTimer:self.respawnSpeed];
            [self waitingWaveAdditionalOptions];
        });
    }
}

- (void)respawnMonstersTimer:(float)time{
    self.respawnMonsterTimer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(spawnMonsters) userInfo:nil repeats:YES];
}

- (void)monsterSkillsTimer:(float)time{
    self.spawnNumber = 0;
    self.wavesNumber = 0;
     self.monsterSkillsTimer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(monsterSkills) userInfo:nil repeats:YES];
}

- (void)waitingWaveTimer:(float)time{
    self.waitingWaveTimer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(waitingWave) userInfo:nil repeats:YES];
}

- (void)wavesNumberToEndLevel:(int)wavesNumber{
    if (self.wavesNumber < wavesNumber) {
        [self waitingWaveTimer:2];
    }else{
        [self.monsterSkillsTimer invalidate];
        [AppEngine defaultEngine].goToNextLevel = YES;
    }
}

- (void)moveByX:(CGFloat)x byY:(CGFloat)y byAngle:(CGFloat)angle{
    self.viewModel.moveByX = x;
    self.viewModel.moveByY = y;
    self.viewModel.moveByAngle = angle;
}

- (void)setBasePosition{
    [AppEngine defaultEngine].baseYPosition = self.viewModel.moveByY;
    [AppEngine defaultEngine].baseXPosition = self.viewModel.moveByX;
}

- (void)setRifleSpeed:(float)rifleSpeed monstersSpeed:(int)monstersSpeed chargingLevel:(int)chargingLevel shootingPower:(int)power{
    self.viewModel.shootingPower = power;
    self.viewModel.speed = rifleSpeed;
    self.viewModel.monsterSpeed = monstersSpeed;
    self.viewModel.maxChargingLevel = chargingLevel;
}

@end
