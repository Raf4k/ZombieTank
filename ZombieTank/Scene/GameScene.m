//
//  GameScene.m
//  ZombieTank
//
//  Created by Rafal Kampa on 12.08.2016.
//  Copyright (c) 2016 Rafal Kampa. All rights reserved.
//

#import "GameScene.h"
#import "StageOne.h"
#import "Defines.h"
#import "GameSceneViewModel.h"
#import "Zombie.h"



@interface GameScene () <SKPhysicsContactDelegate>
@property (nonatomic, strong) SKSpriteNode *tankRifle;
@property (nonatomic , strong) SKAction *rotateAction;
@property (nonatomic, strong) GameSceneViewModel *viewModel;
@property (nonatomic, strong) StageOne *stageOne;
@property (nonatomic, assign) BOOL rotating;
@end
@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    self.viewModel = [[GameSceneViewModel alloc] init];
    self.physicsWorld.contactDelegate = self;
#warning change by stage
    self.viewModel.currentEnemyName = @"zombie";
    
    self.tankRifle = (SKSpriteNode *)[self childNodeWithName:spriteNameTankRifle];
    self.tankRifle.physicsBody.categoryBitMask = sprite1Category;
    self.tankRifle.physicsBody.contactTestBitMask = sprite2Category;
    
    StageOne *stageOne = [StageOne nodeWithFileNamed:@"StageOne"];
    stageOne.physicsWorld.contactDelegate = self;
    [stageOne createZombieFromScene:self];
}

- (void)update:(NSTimeInterval)currentTime{
    [self.viewModel updateEnemyPosition:self.children basePosition:self.tankRifle.position enemyName:self.viewModel.currentEnemyName];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (!self.rotating) {
//        self.rotating = YES;
        CGPoint touchLocation = [[touches anyObject] locationInNode:self];
        [self.viewModel calculateRadiusAndDurationTimeFromTouchLocation:touchLocation spriteNode:self.tankRifle];
        self.rotateAction = [SKAction rotateToAngle:self.viewModel.moveByRadius duration:self.viewModel.duration shortestUnitArc:YES];
        [self startObjectAnimation];
    }
}

-(void)startObjectAnimation {
    [self.tankRifle removeAllActions];
    [self.tankRifle runAction:self.rotateAction completion:^{
        self.rotating = NO;
        NSLog(@"kabuum");
    }];
}

- (void)didBeginContact:(SKPhysicsContact *)contact{
    [contact.bodyB.node removeFromParent];
}







@end
