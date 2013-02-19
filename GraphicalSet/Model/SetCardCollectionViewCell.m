//
//  SetCardCollectionViewCell.m
//  GraphicalSet
//
//  Created by Norimasa Nabeta on 2013/02/19.
//  Copyright (c) 2013年 CS193p. All rights reserved.
//

#import "SetCardCollectionViewCell.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardCollectionViewCell ()
@property (strong, nonatomic) SetCardDeck *deck;
@end


@implementation SetCardCollectionViewCell

-(Deck *)deck
{
    if (!_deck) _deck = [[SetCardDeck alloc] init];
    return _deck;
}

- (void)setSetCard:(SetCardView *)setCard
{
    _setCard = setCard;
    [self drawRandomSetCard];
    
}
-(void)drawRandomSetCard
{
    Card *card = [self.deck drawRandomCard];
    if ([card isKindOfClass:[SetCard class]]) {
        SetCard *setCard = (SetCard *)card;
        self.setCard.rank = setCard.rank;
        self.setCard.suit = setCard.suit;
    }
}



@end
