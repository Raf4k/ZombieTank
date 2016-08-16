//
//  StageOne.h
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface StageOne : SKScene
- (void)createMonstersFromScene:(SKScene *)scene;
- (NSArray *)arrayWithMonsters;
@end
