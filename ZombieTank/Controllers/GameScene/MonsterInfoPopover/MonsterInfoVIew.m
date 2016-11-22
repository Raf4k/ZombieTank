//
//  MonsterInfoVIew.m
//  ZombieTank
//
//  Created by Rafal Kampa on 21.11.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "MonsterInfoView.h"
@interface MonsterInfoView()
@property (weak, nonatomic) IBOutlet UIImageView *imageMonster;
@property (weak, nonatomic) IBOutlet UIImageView *imageBackground;
@property (weak, nonatomic) IBOutlet UILabel *labelMonsterInfo;
@property (weak, nonatomic) IBOutlet UIButton *buttonReady;

@end
@implementation MonsterInfoView

- (IBAction)okButtonTapped:(UIButton *)sender {
    [self.delegate okButtonTapped];
}

@end
