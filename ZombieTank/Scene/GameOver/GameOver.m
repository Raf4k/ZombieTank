//
//  GameOver.m
//  ZombieTank
//
//  Created by Euvic on 16.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "GameOver.h"
#import "GameScene.h"

@implementation GameOver

- (id)initWithSize:(CGSize)size lost:(BOOL)lost{
    if (self = [super initWithSize:size]) {
        
        // 1
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        // 2
        NSString * message;
        if (lost) {
            message = @"You Lost!";
        } else {
            message = @"You Win :[";
        }
        
        // 3
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        label.text = message;
        label.fontSize = 40;
        label.fontColor = [SKColor blackColor];
        label.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:label];
        
        // 4
        [self runAction:
         [SKAction sequence:@[
                              [SKAction waitForDuration:3.0],
                              [SKAction runBlock:^{
             // 5
             SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
             SKScene * myScene = [[SKScene alloc] initWithSize:self.size];
             [self.view presentScene:myScene transition: reveal];
         }]
                              ]]
         ];
        
    }
    return self;
}
@end
