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
#import "Zombie.h"

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
    self.tankRifle.physicsBody.affectedByGravity = NO;
    
    Zombie *zombie = (Zombie *)[Zombie zombieSpriteNode];
    zombie.position = CGPointMake(0, 300);
    [self addChild:zombie];
    Zombie *zombie2 = (Zombie *)[Zombie zombieSpriteNode];
    zombie2.position = CGPointMake(1000, 300);
    [self addChild:zombie2];
}

- (void)updateZomibesPosition{
    CGPoint position = self.tankRifle.position;
    for (SKNode *zombie in self.children) {
        if ([zombie.name isEqualToString:@"zombie"]) {
            CGPoint currentPosition = zombie.position;
            double angle = atan2(currentPosition.y - position.y, (currentPosition.x - position.x) + M_PI);
            
            CGFloat velX = 75 * cos(angle);
            CGFloat velY = 75 * sin(angle);
            
            zombie.physicsBody.velocity = CGVectorMake(-velX, -velY);
        }
    }
}


- (void)update:(NSTimeInterval)currentTime{
    [self updateZomibesPosition];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (!self.rotating) {
        self.rotating = YES;
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
    }];
}







@end
