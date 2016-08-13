//
//  Utilities.m
//  ZombieTank
//
//  Created by Rafal Kampa on 13.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+ (CGPoint)positionOfRespawnPlaceFromNodesArray:(NSArray *)nodesArray respawnName:(NSString *)respawnName{
    
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
                return node.position;
                break;
            }
        }
    }
    
    return CGPointMake(0, 0);
}



@end
