//
//  ProjectWallCell.h
//  ProjectWall
//
//  Created by Banu Chander on 5/13/13.
//  Copyright (c) 2013 Banu Chander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProjectWallModal;
@interface ProjectWallCell : UITableViewCell{
    
    IBOutlet UIImageView *imgPersonThumbUrl;
    IBOutlet UILabel *lblPersonTitle;
    IBOutlet UILabel *lblPersonSubtitle;
    IBOutlet UILabel *lblProjectDescription;
    
    id tableViewDelegate;
    
    int rowIndex;
    int sectionIndex;
    ProjectWallModal *thisCellProjectWallModal;
    
}

@property(nonatomic,assign)id tableViewDelegate;
@property(nonatomic,readwrite)int rowIndex;
@property(nonatomic,readwrite)int sectionIndex;
@property(nonatomic,assign)ProjectWallModal *thisCellProjectWallModal;


-(IBAction)btnExpandClicked:(id)sender;
-(void)loadCellValuesWithModal:(ProjectWallModal *)currProjectWallModal;

@end
