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
#import "ShootingBall.h"
#import "Zombie.h"
#import "Utilities.h"

@interface GameScene () <SKPhysicsContactDelegate>
@property (nonatomic, strong) SKSpriteNode *tankRifle;
@property (nonatomic , strong) SKAction *rotateAction;
@property (nonatomic, strong) GameSceneViewModel *viewModel;
@property (nonatomic, strong) ShootingBall *shootingBall;
@property (nonatomic, strong) StageOne *stageOne;
@property (nonatomic, strong) SKSpriteNode *bangNode;
@property (nonatomic, assign) BOOL rotating;
@property (nonatomic, assign) double lastAngle;
@end
@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    self.viewModel = [[GameSceneViewModel alloc] init];
    self.viewModel.currentEnemyName = spriteNameEnemyZombie;
    self.physicsWorld.contactDelegate = self;
    
    self.tankRifle = (SKSpriteNode *)[self childNodeWithName:spriteNameTankRifle];
    self.bangNode = (SKSpriteNode *)[self childNodeWithName:spriteNameBang];
    StageOne *stageOne = [StageOne nodeWithFileNamed:stageNameStageOne];
    
    [Utilities createPhysicBodyWithoutContactDetection:self.tankRifle];
    [Utilities createPhysicBodyWithoutContactDetection:self.bangNode];
    self.bangNode.alpha = 0;

    [self.physicsWorld addJoint:[Utilities jointPinBodyA:self.tankRifle.physicsBody toBodyB:self.bangNode.physicsBody atPosition:self.tankRifle.position]];
    
    [stageOne createZombieFromScene:self];
}

- (void)update:(NSTimeInterval)currentTime{
    [self.viewModel updateEnemyPosition:self.children basePosition:self.tankRifle.position enemyName:self.viewModel.currentEnemyName];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (!self.rotating) {
        self.rotating = YES;
        self.bangNode.alpha = 0;
        
        CGPoint positionInScene = [[touches anyObject] locationInNode:self];
        self.rotateAction = [SKAction rotateToAngle:[self.viewModel calculateRadiusAndDurationTimeFromTouchLocation:positionInScene spriteNode:self.tankRifle] duration:self.viewModel.speed];
        
        self.bangNode.texture = [SKTexture textureWithImage:[UIImage imageNamed:[self.viewModel setBangSpriteImage]]];
        
        [self startObjectAnimationToPosition:positionInScene];
    }
}

-(void)startObjectAnimationToPosition:(CGPoint)position {
    [self.tankRifle removeAllActions];
    self.rotating = NO;
    [self.tankRifle runAction:self.rotateAction completion:^{
        [self shootBallToPosition:position];
        [self.bangNode runAction:[Utilities fadeInFadeOutAction]];
    }];
}

- (void)didBeginContact:(SKPhysicsContact *)contact{
    SKPhysicsBody *firstBody;
    if (contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
    }else{
        firstBody = contact.bodyB;
    }
    
    if (firstBody == self.shootingBall.physicsBody) {
        [contact.bodyB.node removeFromParent];
        [contact.bodyA.node removeFromParent];
        [self.viewModel createCartoonLabelsWithName:@"boom" atPosition:firstBody.node.position inScene:self];
    }else{
        [contact.bodyB.node removeFromParent];
    }
}

- (void)shootBallToPosition:(CGPoint)position{
    self.shootingBall = [ShootingBall shootingBallSpriteNodeWithStartPosition:self.bangNode.position];
    [self addChild:self.shootingBall];

    CGVector vector = CGVectorMake(position.x - self.tankRifle.position.x, position.y - self.tankRifle.position.y);
    [self.shootingBall.physicsBody applyImpulse:vector];
}





@end
