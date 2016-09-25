//
//  LevelSelectionViewController.m
//  ZombieTank
//
//  Created by Rafal Kampa on 25.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "LevelSelectionViewController.h"
#import "LevelSelectionCollectionViewCell.h"
#import "GameViewController.h"
#import "Defines.h"

@interface LevelSelectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger selectedLevel;
@end

@implementation LevelSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:[[LevelSelectionCollectionViewCell class] description] bundle:nil] forCellWithReuseIdentifier:[[LevelSelectionCollectionViewCell class] description]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LevelSelectionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[LevelSelectionCollectionViewCell class]description] forIndexPath:indexPath];
    [cell customizeWithIndex:indexPath.row + 1];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedLevel = indexPath.row + 1;
    [self performSegueWithIdentifier:segueGoToMainScene sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    GameViewController *vc = segue.destinationViewController;
    vc.selectedLevel = self.selectedLevel;
}


@end
