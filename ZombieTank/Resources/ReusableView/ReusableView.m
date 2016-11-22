//
//  ReuseableView.m
//  mHosp
//
//  Created by Piotr Gawlowski on 07.07.2016.
//  Copyright © 2016 EUVIC. All rights reserved.
//


#import "ReusableView.h"

@interface ReusableView ()
@property (nonatomic, strong) UIView *contentView;
@end

@implementation ReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setupXib];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self setupXib];
    
    return self;
}

- (void)setupXib {
    self.contentView = [self loadFromNib];
    
    self.contentView.frame = self.bounds;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:self.contentView];
}

- (UIView *)loadFromNib {
    NSBundle *bundle = [NSBundle bundleForClass: [self class]];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:bundle];
    UIView *view = (UIView *)[[nib instantiateWithOwner:self options:nil] firstObject];
    
    return view;
}

@end
