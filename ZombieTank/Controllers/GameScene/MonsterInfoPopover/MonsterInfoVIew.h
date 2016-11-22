//
//  MonsterInfoVIew.h
//  ZombieTank
//
//  Created by Rafal Kampa on 21.11.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "ReusableView.h"
@protocol MonsterInfoDelegate
- (void)okButtonTapped;
@end
@interface MonsterInfoView : ReusableView
@property (nonatomic, weak) id<MonsterInfoDelegate>delegate;

@end
