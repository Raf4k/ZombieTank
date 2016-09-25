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
    
- (void)setHealth:(int)health{
    NSNumber *number = [NSNumber numberWithInt:health];
    objc_setAssociatedObject(self, @selector(health), number, OBJC_ASSOCIATION_ASSIGN);
}

- (int)health {
    NSNumber *number = objc_getAssociatedObject(self, @selector(health));
    
    return [number intValue];
}

@end

