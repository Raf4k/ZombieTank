//
//  StagesParent.h
//  ZombieTank
//
//  Created by Rafal Kampa on 19.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameSceneViewModel.h"

@interface StagesParent : SKScene
@property (nonatomic, strong)GameSceneViewModel *viewModel;
@property (nonatomic, strong) SKScene *parentScene;

- (void)arrayWithMonsters;
- (void)createMonstersFromScene:(SKScene *)scene;
- (void)moveByX:(CGFloat)x byY:(CGFloat)y;
- (void)setRifleSpeed:(int)rifleSpeed monstersSpeed:(int)monstersSpeed chargingLevel:(int)chargingLevel;
@end
