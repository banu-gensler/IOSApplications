//
//  ProjectWallCell.m
//  ProjectWall
//
//  Created by Banu Chander on 5/13/13.
//  Copyright (c) 2013 Banu Chander. All rights reserved.
//

#import "ProjectWallCell.h"
#import "ProjectWallViewController.h"
#import "ProjectWallModal.h"

#define kButtonStateCollapsed 101
#define kButtonStateExpanded 102

@implementation ProjectWallCell

@synthesize rowIndex,sectionIndex;
@synthesize tableViewDelegate = _tableViewDelegate;
@synthesize thisCellProjectWallModal=_thisCellProjectWallModal;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)loadCellValuesWithModal:(ProjectWallModal *)currProjectWallModal{
    
    [self setThisCellProjectWallModal:currProjectWallModal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(IBAction)btnExpandClicked:(id)sender{
    
    if ([self.thisCellProjectWallModal isExpanded]==FALSE) {
        [self.thisCellProjectWallModal setIsExpanded:TRUE];
    }
    else{
        [self.thisCellProjectWallModal setIsExpanded:FALSE];
    }
    
    
//    UIButton *btnSender = (UIButton *)sender;
//    if (btnSender.tag == kButtonStateCollapsed) {
//        //The cell view is in collapse mode so make it to expanded state
//        [btnSender setTag:kButtonStateExpanded];
//        [self setFrame:CGRectMake(0, 0, 320, 200)];
//        [self setAutoresizesSubviews:YES];
//        //[self layoutSubviews];
//    }
//    else{
//        //Cell view is on expanded mode so make it expand
//        [self setFrame:CGRectMake(0, 0, 320, 160)];
//        [btnSender setTag:kButtonStateCollapsed];
//    }
    
    [self.tableViewDelegate cellClickedWithIndexPathRow:self.rowIndex andSectionVal:self.sectionIndex];
    

}

-(void)layoutSubviews{
    
    NSLog(@"Layout subviews called");
    
}


@end
