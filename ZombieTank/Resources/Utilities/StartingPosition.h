//
//  StartingPosition.h
//  ZombieTank
//
//  Created by Rafal Kampa on 23.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameSceneViewModel.h"

@interface StartingPosition : NSObject

+ (void)startingPositionBasedOnLvl:(int)lvl viewModel:(GameSceneViewModel *)viewModel;

@end
