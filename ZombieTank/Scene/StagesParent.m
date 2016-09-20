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

- (void)moveByX:(CGFloat)x byY:(CGFloat)y{
    self.viewModel.moveByX = x;
    self.viewModel.moveByY = y;
}

- (void)setRifleSpeed:(int)rifleSpeed monstersSpeed:(int)monstersSpeed chargingLevel:(int)chargingLevel{
    self.viewModel.speed = rifleSpeed;
    self.viewModel.monsterSpeed = monstersSpeed;
    self.viewModel.maxChargingLevel = chargingLevel;
}
@end
