//
//  GameViewModel.h
//  ZombieTank
//
//  Created by Rafal Kampa on 21.11.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameViewModel : NSObject
@property (nonatomic, assign) int selectedLevel;

- (BOOL)shouldCreatePopoverMonserInfoFromLevel:(int)level;

@end
