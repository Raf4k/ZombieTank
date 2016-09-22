//
//  Utilities.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Utilities.h"
#import "Defines.h"
#import "AppEngine.h"


@implementation Utilities

+ (CGPoint)positionOfRespawnPlaceFromNodesArray:(NSArray *)nodesArray respawnName:(NSString *)respawnName{
    int baseXPosition = [AppEngine defaultEngine].baseXPosition;
    int baseYPosition = [AppEngine defaultEngine].baseYPosition;
    
    int numberOfRespawns = 0;
    
    for (SKNode *node in nodesArray) {
        if ([node.name isEqualToString:respawnName]) {
            numberOfRespawns ++;
        }
    }
    
    int randomNumber = arc4random() % numberOfRespawns;
    randomNumber++;
    numberOfRespawns = 0;
    
    for (SKNode *node in nodesArray) {
        if ([node.name isEqualToString:respawnName]) {
            numberOfRespawns ++;
            if (numberOfRespawns == randomNumber) {
                return CGPointMake(node.position.x + baseXPosition, node.position.y + baseYPosition);
                break;
            }
        }
    }
    
    return CGPointMake(0, 0);
}

+ (CGPoint)positionOfRespawnWithoutRandomizePlaceFromNodesArray:(NSArray *)nodesArray respawnName:(NSString *)respawnName number:(int)number{
    int baseXPosition = [AppEngine defaultEngine].baseXPosition;
    int baseYPosition = [AppEngine defaultEngine].baseYPosition;
    
    int numberOfRespawns = 0;
    
    for (SKNode *node in nodesArray) {
        if ([node.name isEqualToString:respawnName]) {
            numberOfRespawns ++;
            if (numberOfRespawns == number) {
                
                return CGPointMake(node.position.x + baseXPosition, node.position.y + baseYPosition);
                break;
            }
        }
    }
    
    return CGPointMake(baseXPosition + 200, baseYPosition + 200);
}

+ (SKPhysicsJointFixed *)jointPinBodyA:(SKPhysicsBody *)bodyA toBodyB:(SKPhysicsBody *)bodyB atPosition:(CGPoint)position{
    return [SKPhysicsJointFixed jointWithBodyA:bodyA bodyB:bodyB anchor:position];
}

+ (void)createPhysicBodyWithoutContactDetection:(SKSpriteNode *)sprite{
    sprite.physicsBody.categoryBitMask = 0;
    sprite.physicsBody.contactTestBitMask = 0;
}

+ (void)createSpriteNode:(SKSpriteNode *)spriteNode withName:(NSString *)name size:(CGSize)size{
    spriteNode.name = name;
    spriteNode.size = size;
    spriteNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spriteNode.size];
    spriteNode.physicsBody.allowsRotation = NO;
    spriteNode.physicsBody.usesPreciseCollisionDetection = YES;
    spriteNode.physicsBody.collisionBitMask = 0;
    spriteNode.physicsBody.categoryBitMask = sprite3Category;
    spriteNode.physicsBody.contactTestBitMask = sprite2Category;
    spriteNode.physicsBody.affectedByGravity = NO;
    spriteNode.zPosition = 3;
}

+ (id)objectFromUserDefaultsWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

+ (void)saveUserDefaultsObject:(id)object forKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    [defaults synchronize];
}

+ (UIColor*)colorWithHexString:(NSString*)hex{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
