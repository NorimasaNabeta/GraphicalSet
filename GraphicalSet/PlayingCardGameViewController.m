//
//  PlayingCardGameViewController.m
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/18.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayingCardCollectionViewCell.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController
- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (NSInteger) startingCount
{
    return 20;
}

-(void) updateCell:(UICollectionViewCell *)cell usingCard: (Card* )card
{
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
        PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).playingCard;
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            playingCardView.faceUp = playingCard.faceUp;
            playingCardView.alpha = playingCard.isUnplayable? 0.3: 1.0;
        }
    }
}

@end
