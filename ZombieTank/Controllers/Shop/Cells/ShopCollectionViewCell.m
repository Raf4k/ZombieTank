//
//  ShopCollectionViewCell.m
//  ZombieTank
//
//  Created by Euvic on 26.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "ShopCollectionViewCell.h"
#import "ItemsCollectionViewCell.h"

@interface ShopCollectionViewCell() <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *itemCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *labelCategory;

@property (nonatomic, strong) NSArray *arrayTank;
@property (nonatomic, strong) NSArray *arraySoldier;
@property (nonatomic, strong) NSArray *arrayRifle;

@end

@implementation ShopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
        [self.itemCollectionView registerNib:[UINib nibWithNibName:[[ItemsCollectionViewCell class] description] bundle:nil] forCellWithReuseIdentifier:[[ItemsCollectionViewCell class] description]];
}

- (void)customizeWithName:(NSString *)name{
    self.labelCategory.text = name;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([self.labelCategory.text isEqualToString:@"Tank"]) {
        return self.arrayTank.count;
    }else if ([self.labelCategory.text isEqualToString:@"Soldier"]){
        return self.arraySoldier.count;
    }else{
        return self.arrayRifle.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[ItemsCollectionViewCell class] description] forIndexPath:indexPath];
    
    return cell;
}

@end
