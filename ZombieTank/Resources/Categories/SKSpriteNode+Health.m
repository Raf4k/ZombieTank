//
//  SKSpriteNode+Health.m
//  ZombieTank
//
//  Created by Rafal Kampa on 25.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "SKSpriteNode+Health.h"
#import <objc/runtime.h>

@implementation SKSpriteNode (Health)
@dynamic health;
@dynamic maxHealth;
    
- (void)setHealth:(int)health{
    NSNumber *number = [NSNumber numberWithInt:health];
    objc_setAssociatedObject(self, @selector(health), number, OBJC_ASSOCIATION_ASSIGN);
}

- (int)health {
    NSNumber *number = objc_getAssociatedObject(self, @selector(health));
    
    return [number intValue];
}

- (void)setMaxHealth:(int)maxHealth{
    NSNumber *number = [NSNumber numberWithInt:maxHealth];
    objc_setAssociatedObject(self, @selector(maxHealth), number, OBJC_ASSOCIATION_ASSIGN);
}

- (int)maxHealth {
    NSNumber *number = objc_getAssociatedObject(self, @selector(maxHealth));
    
    return [number intValue];
}

@end

