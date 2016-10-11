//
//  ShopViewController.m
//  ZombieTank
//
//  Created by Rafal Kampa on 12.08.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "ShopViewController.h"
#import "ShopCollectionViewCell.h"

@interface ShopViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *shopCollectionView;
@property (nonatomic, strong) NSArray *arrayCategories;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayCategories = [[NSArray alloc]initWithObjects:@"Tanks",@"Soldiers",@"Rifles", nil];
     [self.shopCollectionView registerNib:[UINib nibWithNibName:[[ShopCollectionViewCell class] description] bundle:nil] forCellWithReuseIdentifier:[[ShopCollectionViewCell class] description]];
     self.shopCollectionView.delegate = self;
     self.shopCollectionView.dataSource = self;
     [self.shopCollectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayCategories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[ShopCollectionViewCell class] description] forIndexPath:indexPath];
    
   [cell customizeWithName:self.arrayCategories[indexPath.row]];
   
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
      sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.shopCollectionView.frame.size.width, self.shopCollectionView.frame.size.height);
}
    
@end
