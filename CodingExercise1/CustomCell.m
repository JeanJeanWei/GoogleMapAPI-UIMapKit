//
//  CustomCell.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "CustomCell.h"
#import "AddressManager.h"
@implementation CustomCell

@synthesize delegate;
@synthesize idx;
@synthesize address;
@synthesize description;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)deleteClicked
{
    NSLog(@"deleteClicked idx = %d", idx);
    [AddressManager.instance deleteAddress:idx];
    [delegate CustomCellDeleteClicked];
}
@end
