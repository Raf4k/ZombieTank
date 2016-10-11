//
//  StartingPosition.m
//  ZombieTank
//
//  Created by Rafal Kampa on 23.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "StartingPosition.h"

@implementation StartingPosition

+ (void)startingPositionBasedOnLvl:(int)lvl viewModel:(GameSceneViewModel *)viewModel{
    switch (lvl) {
        case 2:
            viewModel.moveByX = 0;
            viewModel.moveByY = 1100;
            viewModel.moveByAngle = 1.5;
            break;
        case 3:
            viewModel.moveByX = 1200;
            viewModel.moveByY = 1100;
            viewModel.moveByAngle = 0;
            break;
        case 4:
            viewModel.moveByX = 1200;
            viewModel.moveByY = 2200;
            viewModel.moveByAngle = 1.5;
            break;
            
        default:
            break;
    }
}
@end
