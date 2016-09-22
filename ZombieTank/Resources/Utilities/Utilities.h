//
//  Utilities.h
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Utilities : NSObject
+ (CGPoint)positionOfRespawnPlaceFromNodesArray:(NSArray *)nodesArray respawnName:(NSString *)respawnName;
+ (CGPoint)positionOfRespawnWithoutRandomizePlaceFromNodesArray:(NSArray *)nodesArray respawnName:(NSString *)respawnName number:(int)number;
+ (void)createPhysicBodyWithoutContactDetection:(SKSpriteNode *)sprite;
+ (void)createSpriteNode:(SKSpriteNode *)spriteNode withName:(NSString *)name size:(CGSize)size;
+ (SKPhysicsJointFixed *)jointPinBodyA:(SKPhysicsBody *)bodyA toBodyB:(SKPhysicsBody *)bodyB atPosition:(CGPoint)position;
+ (id)objectFromUserDefaultsWithKey:(NSString *)key;
+ (void)saveUserDefaultsObject:(id)object forKey:(NSString *)key;
+ (UIColor*)colorWithHexString:(NSString*)hex;
@end
