//
//  GameScene.m
//  ZombieTank
//
//  Created by Rafal Kampa on 12.08.2016.
//  Copyright (c) 2016 Rafal Kampa. All rights reserved.
//

#import "GameScene.h"
#import "Defines.h"
#import "GameSceneViewModel.h"
@interface GameScene ()
@property (nonatomic, strong) SKSpriteNode *tankRifle;
@property (nonatomic , strong) SKAction *rotateAction;
@property (nonatomic, strong) GameSceneViewModel *viewModel;
@property (nonatomic, assign) BOOL rotating;
@end
@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    self.viewModel = [[GameSceneViewModel alloc] init];
    
    self.tankRifle = (SKSpriteNode *)[self childNodeWithName:spriteNameTankRifle];
    self.tankRifle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.tankRifle.frame.size];
    self.tankRifle.physicsBody.affectedByGravity = NO;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (!self.rotating) {
        self.rotating = YES;
        CGPoint touchLocation = [[touches anyObject] locationInNode:self];
        
        [self.viewModel calculateRadiusAndDurationTimeFromTouchLocation:touchLocation spriteNode:self.tankRifle];
        NSLog(@"%f",self.viewModel.duration);
        self.rotateAction = [SKAction rotateToAngle:self.viewModel.moveByRadius duration:self.viewModel.duration shortestUnitArc:YES];
        
        [self startObjectAnimation];
    }
}

-(void)startObjectAnimation {
    [self.tankRifle removeAllActions];
    [self.tankRifle runAction:self.rotateAction completion:^{
        self.rotating = NO;
    }];

}






@end
