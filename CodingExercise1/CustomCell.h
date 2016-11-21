//
//  CustomCell.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomCell;

@protocol CustomCellDelegate

- (void)CustomCellDeleteClicked;

@end

@interface CustomCell : UITableViewCell
{
    int idx;
    IBOutlet UILabel *address;
    IBOutlet UILabel *description;
    IBOutlet UIButton *btnDelete;
    __unsafe_unretained id<CustomCellDelegate> delegate;
}

@property (assign) int idx;
@property (strong) IBOutlet UILabel *address;
@property (strong) IBOutlet UILabel *description;

@property (unsafe_unretained) id<CustomCellDelegate> delegate;

- (IBAction)deleteClicked;

@end
