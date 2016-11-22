//
//  GameViewModel.m
//  ZombieTank
//
//  Created by Rafal Kampa on 21.11.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "GameViewModel.h"

@implementation GameViewModel

- (BOOL)shouldCreatePopoverMonserInfoFromLevel:(int)level {
    self.selectedLevel = level;
    return YES;
}

@end
