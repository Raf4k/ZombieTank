//
//  Ghost.h
//  ZombieTank
//
//  Created by Euvic on 16.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Ghost : SKSpriteNode
+ (Ghost *)ghostSpriteNode;
+ (void)changePhysicsBody:(Ghost *)ghost;
+ (void)dissapearGhostsFromparentScene:(SKScene *)parentScene;
@end
