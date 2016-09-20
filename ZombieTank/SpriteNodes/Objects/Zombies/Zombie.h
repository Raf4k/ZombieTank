//
//  Zombie.h
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


@interface Zombie : SKSpriteNode

+ (Zombie *)zombieSpriteNode;
+ (void)dashZombieFromParentScene:(SKScene *)parentScene;

@end



