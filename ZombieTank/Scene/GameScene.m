//
//  GameScene.m
//  ZombieTank
//
//  Created by Rafal Kampa on 12.08.2016.
//  Copyright (c) 2016 Rafal Kampa. All rights reserved.
//

#import "GameScene.h"
#import "Defines.h"
@interface GameScene ()

@property (nonatomic, strong) SKSpriteNode *tankRifle;

@end
@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    self.tankRifle = (SKSpriteNode *)[self childNodeWithName:spriteNameTankRifle];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    
//}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
