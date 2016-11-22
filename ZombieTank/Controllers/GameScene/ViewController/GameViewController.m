//
//  GameViewController.m
//  ZombieTank
//
//  Created by Rafal Kampa on 12.08.2016.
//  Copyright (c) 2016 Rafal Kampa. All rights reserved.
//

#import "GameViewController.h"
#import "MonsterInfoView.h"

#import "GameViewModel.h"
#import "GameScene.h"
#import "Utilities.h"
#import "AppEngine.h"
#import "Defines.h"

@interface GameViewController() <GameSceneDelegate, MonsterInfoDelegate>
@property (nonatomic, assign) float maxWidthHealth;
@property (nonatomic, assign) BOOL isPause;
@property (nonatomic, assign) BOOL gameIsOver;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayPause;
@property (weak, nonatomic) IBOutlet UILabel *labelPause;
@property (weak, nonatomic) IBOutlet UIView *chargingView;
@property (weak, nonatomic) IBOutlet UIView *bossHealth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bossHealthConstraintWidth;

@property (nonatomic, strong) GameViewModel *viewModel;
@property (nonatomic, strong) MonsterInfoView *monsterInfoView;
@property (nonatomic, strong) GameScene *scene;
@end

@implementation GameViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.viewModel = [[GameViewModel alloc] init];
    self.labelPause.alpha = 0;
    self.navigationController.navigationBar.hidden = YES;
    
    SKView * skView = (SKView *)self.view;
    skView.ignoresSiblingOrder = YES;
    
    self.bossHealth.hidden = YES;
    self.maxWidthHealth = self.bossHealthConstraintWidth.constant;
    
    // Create and configure the scene.
    self.scene = [GameScene nodeWithFileNamed:@"GameScene"];
    self.scene.gameSceneDelegate = self;
    self.scene.selectedLevel = self.selectedLevel;
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:self.scene];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - Button actions
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

#pragma mark - Scene delegate methods
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

- (void)bossWasHitBy:(int)health maxHealth:(int)maxHealth{
    self.bossHealth.hidden = NO;
    float width = self.maxWidthHealth * health / maxHealth;
    if (width == 0) {
        self.bossHealth.hidden = YES;
    }else{
        self.bossHealthConstraintWidth.constant = width;
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

- (void)createMonsterInfoPopupWithLevel:(int)level {
    if ([self.viewModel shouldCreatePopoverMonserInfoFromLevel:level]) {
        self.monsterInfoView = [[MonsterInfoView alloc] init];
        self.monsterInfoView.alpha = 0;
        self.monsterInfoView.delegate = self;
        [self.view addSubview:self.monsterInfoView];
        [self constraints];
        [self animationFadeIn:YES completion:^(BOOL finished) {
        }];
    }else {
        [self.scene createWorldLevel];
    }
}

#pragma mark - Monster Info delegate
- (void)okButtonTapped {
    [self animationFadeIn:NO completion:^(BOOL finished) {
        [self.monsterInfoView removeFromSuperview];
        [self.scene createWorldLevel];
    }];
}

#pragma mark - Helper methods
- (void)animationFadeIn:(BOOL)fadeIn completion:(void (^ __nullable)(BOOL finished))completion {
    [UIView animateWithDuration:2 animations:^{
        self.monsterInfoView.alpha = fadeIn ? 0.9 : 0;
        
    }completion:^(BOOL finished) {
        completion(YES);
    }];
}

- (void)constraints {
    
    self.monsterInfoView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint
                                   constraintWithItem:self.monsterInfoView
                                   attribute:NSLayoutAttributeCenterX
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.view
                                   attribute:NSLayoutAttributeCenterX
                                   multiplier:1.0f
                                   constant:0];
    
    //Bottom
    NSLayoutConstraint *bottom =[NSLayoutConstraint
                                 constraintWithItem:self.monsterInfoView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                 multiplier:1.0f
                                 constant:-40];
    //top
    NSLayoutConstraint *top =[NSLayoutConstraint
                              constraintWithItem:self.monsterInfoView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0f
                              constant:40];
    //width
    NSLayoutConstraint *width = [NSLayoutConstraint
                                 constraintWithItem:self.monsterInfoView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:0
                                 constant:300];
    
    [self.view addConstraint:centerX];
    [self.view addConstraint:bottom];
    [self.view addConstraint:top];
    [self.monsterInfoView addConstraint:width];
}


@end
