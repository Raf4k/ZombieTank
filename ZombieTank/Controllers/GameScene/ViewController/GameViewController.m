//
//  GameViewController.m
//  ZombieTank
//
//  Created by Rafal Kampa on 12.08.2016.
//  Copyright (c) 2016 Rafal Kampa. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "Utilities.h"
#import "AppEngine.h"
#import "Defines.h"
@interface GameViewController() <GameSceneDelegate>
@property (nonatomic, strong) GameScene *scene;
@property (nonatomic, assign) BOOL isPause;
@property (nonatomic, assign) BOOL gameIsOver;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayPause;
@property (weak, nonatomic) IBOutlet UILabel *labelPause;
@property (weak, nonatomic) IBOutlet UIView *chargingView;
@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [AppEngine defaultEngine].startingLvl = 1;
    self.labelPause.alpha = 0;
    self.navigationController.navigationBar.hidden = YES;
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    self.scene = [GameScene nodeWithFileNamed:@"GameScene"];
    self.scene.gameSceneDelegate = self;
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:self.scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (IBAction)quitButtonTapped:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)playPauseButtonTapped:(UIButton *)sender {
    
    if (self.gameIsOver) {
        self.gameIsOver = NO;
        [self.scene removeAllActions];
        [self.scene removeAllChildren];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        self.isPause = self.isPause ? NO : YES;
        if (self.isPause) {
            [UIView animateWithDuration:1 animations:^{
                self.labelPause.alpha = 1;
            }];
            [self.buttonPlayPause setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
            self.scene.view.paused = YES;
        }else{
            [self.buttonPlayPause setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
            self.scene.view.paused = NO;
            [UIView animateWithDuration:1 animations:^{
                self.labelPause.alpha = 0;
            }];
        }
    }
}

- (void)chargingLevel:(int)level maxLevel:(int)maxLevel{
    for (UIImageView *imgView in self.chargingView.subviews) {
        [imgView removeFromSuperview];
    }
    float startMargin = 0;
    for (int i = 0; i < maxLevel; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(startMargin, 0, 12, 42)];
        startMargin = startMargin + 17;
        if (level < i) {
            imgView.image = [UIImage imageNamed:@"charging"];
        }else{
            imgView.image = [UIImage imageNamed:@"charged"];
        }
        [self.chargingView addSubview:imgView];
    }
}

- (void)stopCharging{
    for (UIImageView *imgView in self.chargingView.subviews) {
        [imgView removeFromSuperview];
    }
}

- (void)gameOver{
    self.gameIsOver = YES;
    self.labelPause.text = @"GAME OVER";
    [self.buttonPlayPause setImage:[UIImage imageNamed:@"retry"] forState:UIControlStateNormal];
    [UIView animateWithDuration:1 animations:^{
        self.labelPause.alpha = 1;
    }];
}

@end
