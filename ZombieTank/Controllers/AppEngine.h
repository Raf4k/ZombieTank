//
//  AppEngine.h
//  ZombieTank
//
//  Created by Rafal Kampa on 15.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppEngine : NSObject

@property (nonatomic, assign) BOOL goToNextLevel;
@property (nonatomic, assign) int baseXPosition;
@property (nonatomic, assign) int baseYPosition;

+ (instancetype)defaultEngine;

@end
