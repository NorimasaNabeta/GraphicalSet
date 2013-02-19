//
//  CardGameViewController.h
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/16.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController

- (Deck *) createDeck;
// startingCardCount
@property (nonatomic) NSInteger startingCount;
-(void) updateCell:(UICollectionViewCell *)cell usingCard: (Card* )card;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (strong, nonatomic) CardMatchingGame *game;

@end
