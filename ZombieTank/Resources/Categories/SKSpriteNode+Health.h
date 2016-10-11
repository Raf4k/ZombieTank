//
//  SKSpriteNode+Health.h
//  ZombieTank
//
//  Created by Rafal Kampa on 25.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKSpriteNode (Health)
@property (nonatomic, assign) int health;
@property (nonatomic, assign) int maxHealth;
@property (nonatomic, assign) int aditionalHealth;

@end



