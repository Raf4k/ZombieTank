//
//  LevelSelectionCollectionViewCell.m
//  ZombieTank
//
//  Created by Rafal Kampa on 25.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "LevelSelectionCollectionViewCell.h"
@interface LevelSelectionCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end
@implementation LevelSelectionCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)customizeWithIndex:(NSInteger)index{
    self.labelTitle.text = [NSString stringWithFormat:@"Level %li",index];
}

@end
