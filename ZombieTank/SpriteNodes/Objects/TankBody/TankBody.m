//
//  TankBody.m
//  ZombieTank
//
//  Created by Rafal Kampa on 23.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "TankBody.h"
#import "Defines.h"
#import "SKSpriteNode+Health.h"

@implementation TankBody
+ (void)tankBodySpriteNode:(SKSpriteNode *)tankBody{
    tankBody.physicsBody.categoryBitMask = sprite1Category;
    tankBody.physicsBody.contactTestBitMask = sprite2Category | sprite3Category;
    tankBody.physicsBody.collisionBitMask = sprite2Category | sprite3Category;
    [tankBody setHealth:1];
}
@end
