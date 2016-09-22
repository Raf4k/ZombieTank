//
//  GameViewController.m
//  ZombieTank
//
//  Created by Rafal Kampa on 12.08.2016.
//  Copyright (c) 2016 Rafal Kampa. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
@interface GameViewController() <GameSceneDelegate>
@property (nonatomic, strong) GameScene *scene;
@property (nonatomic, assign) BOOL isPause;
@property (nonatomic, assign) BOOL gameIsOver;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayPause;
@property (weak, nonatomic) IBOutlet UILabel *labelPause;
@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelPause.alpha = 0;
    self.navigationController.navigationBar.hidden = YES;
    // Configure the view.
    SKView * skView = (SKView *)self.view;
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
    
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

- (void)gameOver{
    self.gameIsOver = YES;
    self.labelPause.text = @"GAME OVER";
    [self.buttonPlayPause setImage:[UIImage imageNamed:@"retry"] forState:UIControlStateNormal];
    [UIView animateWithDuration:1 animations:^{
        self.labelPause.alpha = 1;
    }];
}

@end
