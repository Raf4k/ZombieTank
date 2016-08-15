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
#import "Actions.h"
#import "Utilities.h"
#import "AppEngine.h"

@interface GameScene () <SKPhysicsContactDelegate>
@property (nonatomic, strong) SKSpriteNode *tankRifle;
@property (nonatomic , strong) SKAction *rotateAction;
@property (nonatomic, strong) GameSceneViewModel *viewModel;
@property (nonatomic, strong) ShootingBall *shootingBall;
@property (nonatomic, strong) StageOne *stageOne;
@property (nonatomic, strong) SKSpriteNode *bangNode;
@property (nonatomic, strong) SKSpriteNode *tankBody;
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
    self.tankBody = (SKSpriteNode *)[self childNodeWithName:spriteNameTankBody];
    StageOne *stageOne = [StageOne nodeWithFileNamed:stageNameStageOne];
    
    [Utilities createPhysicBodyWithoutContactDetection:self.tankRifle];
    [Utilities createPhysicBodyWithoutContactDetection:self.bangNode];
    self.bangNode.alpha = 0;

    [self.physicsWorld addJoint:[Utilities jointPinBodyA:self.tankRifle.physicsBody toBodyB:self.bangNode.physicsBody atPosition:self.tankRifle.position]];
//    [self.physicsWorld addJoint:[Utilities jointPinBodyA:self.tankBody.physicsBody toBodyB:self.tankRifle.physicsBody atPosition:self.tankBody.position]];
    
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
        
        self.bangNode.texture = [SKTexture textureWithImage:[UIImage imageNamed:[self.viewModel setBangSpriteImage]]];
        [self startObjectAnimationToPosition:positionInScene];
    }
}

-(void)startObjectAnimationToPosition:(CGPoint)position {
    [self.tankRifle removeAllActions];
    self.rotating = NO;
    [self.tankRifle runAction:[SKAction rotateToAngle:[self.viewModel calculateRadiusAndDurationTimeFromTouchLocation:position spriteNode:self.tankRifle] duration:self.viewModel.speed] completion:^{
        [self shootBallToPosition:position];
        [self.bangNode runAction:[Actions fadeInFadeOutAction]];
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
        [self checkNodes];
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

- (void)didSimulatePhysics{
    SKCameraNode *camera = (SKCameraNode *)[self childNodeWithName:@"camera"];
    camera.position = CGPointMake(self.tankBody.position.x, self.tankBody.position.y - 100);
    self.camera = camera;
}

- (void)checkNodes{
    BOOL zombies = NO;
    for (SKNode *node in self.children) {
        if ([node.name isEqualToString:spriteNameEnemyZombie]) {
            zombies = YES;
        }
    }
    if (zombies == NO && [AppEngine defaultEngine].goToNextLevel) {
        [self.tankBody runAction:[Actions rotateToAngle:1.5 andMoveByX:0 moveByY:800]];
        [self.tankRifle runAction:[Actions rotateToAngle:1.5 andMoveByX:0 moveByY:800]];
        [AppEngine defaultEngine].goToNextLevel = NO;
    }
}




@end
