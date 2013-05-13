//
//  ProjectWallViewController.h
//  ProjectWall
//
//  Created by Banu Chander on 5/10/13.
//  Copyright (c) 2013 Banu Chander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectWallViewController : UIViewController{
    
    //Tableview to load the project wall details
    IBOutlet UITableView *tblProjectWall;
    
    //Project wall modal objects datasource
    NSMutableArray *projectWallModalsArray;
    
}

//@property(nonatomic,retain)IBOutlet UITableView *tblProjectWall;
-(void)cellClickedWithIndexPathRow:(int)rowVal andSectionVal:(int)sectionVal;

@end
