//
//  SetCardView.h
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/19.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
// #import "PlayingCardView.h"

@interface SetCardView : UIView
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

@end
