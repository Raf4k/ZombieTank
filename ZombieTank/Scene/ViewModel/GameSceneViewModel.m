//
//  GameSceneViewModel.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "GameSceneViewModel.h"
#import "Utilities.h"
#import "Defines.h"
#import "Actions.h"
#import "StartingPosition.h"
#import "SKSpriteNode+Health.h"
#import "SKSpriteNode+Speed.h"
#import "AppEngine.h"

#define speedRotation 0.5;
@interface GameSceneViewModel()


@end
@implementation GameSceneViewModel

- (double)calculateRadiusAndDurationTimeFromTouchLocation:(CGPoint)positionInScene spriteNode:(SKSpriteNode *)spriteNode{
    double dx = spriteNode.position.x - positionInScene.x;
    double dy = spriteNode.position.y - positionInScene.y;
    double angle = atan2(dx, dy) + M_PI_2;
    self.speed = 0.5;
    double firstValue;
    double secondValue;
    
    if (angle > 4) {
        double rest = (int)angle + 1 - angle;
        angle =( 1 + rest) * -1.2;
    }else if (angle > 3){
        double rest = (int)angle + 1 - angle;
        angle = (2 + rest + 0.1) * -1.05;
    }

    if (angle * -1 > 3.14) {
        angle = 3;
    }
    
    if (self.lastAngle > angle) {
        firstValue = self.lastAngle;
        secondValue = angle;
    }else{
        firstValue = angle;
        secondValue = self.lastAngle;
    }
    
    if (firstValue - secondValue < 1.3) {
        self.speed = 0.1;
    }else if (firstValue - secondValue < 2){
        self.speed = 0.2;
    }

    self.lastAngle = angle;
    return -angle;
}

- (void)updateEnemyPosition:(NSArray *)children basePosition:(CGPoint)position enemyNames:(NSArray *)enemyName{

    for (int i = 0; i < enemyName.count; i++) {
        NSString *enemyNameString = enemyName[i];
        if (![enemyNameString isEqualToString:spriteNameEnemyNotMoving]) {
            for (SKNode *monster in children) {
                if ([monster.name isEqualToString:enemyNameString]) {
                    CGPoint currentPosition = monster.position;
                    double angle = atan2(currentPosition.y - position.y, (currentPosition.x - position.x) + M_PI);
                    
                    SKSpriteNode *node = (SKSpriteNode *)monster;
                    
                    
                    CGFloat velX = (self.monsterSpeed + node.speed) * cos(angle);
                    CGFloat velY = (self.monsterSpeed + node.speed) * sin(angle);
                    
                    monster.physicsBody.velocity = CGVectorMake(-velX, -velY);
                }
            }
        }
    }    
}

- (BOOL)healthIsZeroFromChildren:(NSArray *)children contactBody:(SKPhysicsBody *)body{
    for (int i =0; i < children.count; i++) {
        SKSpriteNode *node = (SKSpriteNode *)children[i];
        if (node.physicsBody == body) {
            node.health = node.health - self.shootingPower;
            if (node.health <= 0) {
                return YES;
            }
            break;
        }
    }
    return NO;
}

- (SKSpriteNode *)spriteNodeFromChildren:(NSArray *)children fromContactBody:(SKPhysicsBody *)body{
    for (int i =0; i < children.count; i++) {
        SKSpriteNode *node = (SKSpriteNode *)children[i];
        if (node.physicsBody == body) {
            return node;
        }
    }
    return nil;
}

- (BOOL)areMonstersInScene:(SKScene *)scene{
    BOOL monsters = NO;
    for (SKNode *node in scene.children) {
        for (int i = 0; i < self.arrayWithMonsters.count; i++) {
            if ([node.name isEqualToString:self.arrayWithMonsters[i]]) {
                monsters = YES;
                break;
            }
        }
    }
    return monsters;
}

- (BOOL)contact:(SKPhysicsContact *)contact isEqualToFirstPhysicBody:(SKPhysicsBody *)body{
    if (contact.bodyA == body || contact.bodyB == body) {
        return YES;
    }else{
        return NO;
    }
}

- (SKSpriteNode *)nodeAfterCollisionWithFireShield:(SKPhysicsContact *)contact{
    if ([contact.bodyA.node.name isEqualToString:spriteNameTankBody]) {
        return (SKSpriteNode *)contact.bodyB.node;
    }else{
         return (SKSpriteNode *)contact.bodyA.node;
    }
}

- (NSString *)setBangSpriteImage{
    
    if (self.lastAngle <= -1.5) {
        return @"bang_2_left";
    }else if (self.lastAngle >= 1.5) {
        return @"bang_2_left";
    }else if (self.lastAngle >= -1.5) {
        return @"bang_2_right";
    }else{
        return @"";
    }
}

- (void)selectedLevel:(NSInteger)selectedLevel{
    self.level = (int)selectedLevel;
    if (!self.level || self.level == 0) {
        self.level = 1;
    }
    [StartingPosition startingPositionBasedOnLvl:self.level viewModel:self];
}

- (void)unlockLevel{
    int lvl = [[Utilities objectFromUserDefaultsWithKey:userDefaultsUnlockedLevel] intValue];
    if (lvl < self.level) {
        [Utilities saveUserDefaultsObject:[NSNumber numberWithInt:self.level] forKey:userDefaultsUnlockedLevel];
    }
}

- (void)createCartoonLabelsWithName:(NSString *)name atPosition:(CGPoint)position inScene:(SKScene *)scene{
    SKSpriteNode *cartoonLabel = [SKSpriteNode spriteNodeWithImageNamed:name];
    
    cartoonLabel.position = position;
    cartoonLabel.size = CGSizeMake(90, 70);
    cartoonLabel.zPosition = 5;
    [scene addChild:cartoonLabel];
    cartoonLabel.alpha = 0;
    [cartoonLabel runAction:[Actions fadeInFadeOutAction] completion:^{
        [cartoonLabel removeFromParent];
    }];
}

- (NSString *)labelHexColorWithLevel:(int)level{
    switch (level) {
        case 1:
            return @"79F700";
            break;
        case 2:
            return @"8041FC";
            break;
        default:
            return @"FC131B";
            break;
    }
}

- (CGPoint)tankPositionFromScene:(SKScene *)scene{
    for (int i = 0; i < scene.children.count; i++) {
        SKSpriteNode *node = (SKSpriteNode *)scene.children[i];
        if ([node.name isEqualToString:spriteNameTankBody]) {
            return node.position;
            break;
        }
    }
    return CGPointMake(0, 0);
}

@end
