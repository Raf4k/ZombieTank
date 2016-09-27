//
//  ItemsCollectionViewCell.m
//  ZombieTank
//
//  Created by Euvic on 26.09.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "ItemsCollectionViewCell.h"

@interface ItemsCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageItem;

@property (weak, nonatomic) IBOutlet UILabel *nameItem;

@end

@implementation ItemsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)customizeWithItem:(NSString *)item{
    self.nameItem.text = item;
    self.imageItem.image = [UIImage imageNamed:item];
}

@end
