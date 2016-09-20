//
//  StagesParent.m
//  ZombieTank
//
//  Created by Rafal Kampa on 19.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StagesParent.h"

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

- (void)respawnMonstersTimer:(float)time{
    self.respawnMonsterTimer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(spawnMonsters) userInfo:nil repeats:YES];
}

- (void)monsterSkillsTimer:(float)time{
     self.monsterSkillsTimer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(monsterSkills) userInfo:nil repeats:YES];
}

- (void)moveByX:(CGFloat)x byY:(CGFloat)y byAngle:(CGFloat)angle{
    self.viewModel.moveByX = x;
    self.viewModel.moveByY = y;
    self.viewModel.moveByAngle = angle;
}

- (void)setRifleSpeed:(float)rifleSpeed monstersSpeed:(int)monstersSpeed chargingLevel:(int)chargingLevel{
    self.viewModel.speed = rifleSpeed;
    self.viewModel.monsterSpeed = monstersSpeed;
    self.viewModel.maxChargingLevel = chargingLevel;
}
@end
