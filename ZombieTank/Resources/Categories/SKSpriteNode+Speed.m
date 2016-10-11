//
//  SKSpriteNode+Speed.m
//  ZombieTank
//
//  Created by Rafal Kampa on 11.10.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "SKSpriteNode+Speed.h"
#import <objc/runtime.h>

@implementation SKSpriteNode (Speed)
@dynamic speed;
- (void)setSpeed:(int)speed{
    NSNumber *number = [NSNumber numberWithInt:speed];
    objc_setAssociatedObject(self, @selector(speed), number, OBJC_ASSOCIATION_ASSIGN);
}

- (int)speed {
    NSNumber *number = objc_getAssociatedObject(self, @selector(speed));
    
    return [number intValue];
}

@end
