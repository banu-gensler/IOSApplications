//
//  ProjectWallViewController.m
//  ProjectWall
//
//  Created by Banu Chander on 5/10/13.
//  Copyright (c) 2013 Banu Chander. All rights reserved.
//

#import "ProjectWallViewController.h"
#import "ASIHTTPRequest.h"
#import "SBJson.h"
#import "Defines.h"
#import "ProjectWallModal.h"
#import "ProjectWallCell.h"

#define kMemberTitleLable 101
#define kMemberSubTitleLabel 102
#define kMemberThumbImage 103
#define kMemberCommentLabel 104
#define kMemberCommentButton 105
#define kMemberLikeButton 106
#define kExpandButton 107


@interface ProjectWallViewController ()

@end

@implementation ProjectWallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    projectWallModalsArray = [[NSMutableArray alloc]init];
    
    //sending the request using the already defined root URL in defines.h and getting the posts using objective c blocks concept
    __weak  ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@projects/00.9047.000/posts",kServiceRoot]]];
    [req addRequestHeader:@"accept" value:@"application/json"];
    [req setCompletionBlock:^{
        
        NSDictionary *dict = [[req responseData] JSONValue];
        NSDictionary *entityList = [dict objectForKey:@"entityList"];
        NSArray *allEntity = [entityList objectForKey:@"entity"];
        
        for (NSDictionary *currentDict in allEntity) {
            
            /********** SAMPLE DATA *************/
            /*"@type" = projectPosts;
             commentCount = 0;
             description = "testing out 1";
             id = "f3e1f8a5-d1fa-4e3f-a72e-16e7fa5905b0";
             imageLink = "iamge_link";
             imageLinkBucket = bucket;
             imageLinkId = id;
             imageLinkRepo = repo;
             postTime = "2013-05-09T09:39:59.960Z";
             selfLink = "";
             title = "Post 1 on Base";
             type = TEXT;
             uniqueId = "";
             */
            
            //Create modal object and dump the parsed values to the arru
            ProjectWallModal *currentModal = [[ProjectWallModal alloc]init];
            [currentModal setCommentCount:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"commentCount"]]];
            [currentModal setDescription:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"description"]]];
            [currentModal setProjectId:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"id"]]];
            [currentModal setImageLink:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"imageLink"]]];
            [currentModal setImageLinkBucket:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"imageLinkBucket"]]];
            [currentModal setImageLinkId:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"imageLinkId"]]];
            [currentModal setImageLinkRepo:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"imageLinkRepo"]]];
            [currentModal setPostTime:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"postTime"]]];
            [currentModal setSelfLink:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"selfLink"]]];
            [currentModal setTitleVal:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"title"]]];
            [currentModal setType:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"type"]]];
            [currentModal setUniqueId:[NSString stringWithFormat:@"%@",[currentDict objectForKey:@"uniqueId"]]];
            [projectWallModalsArray addObject:currentModal];
            
            NSLog(@"%@ is description",[currentDict objectForKey:@"description"]);
        }
        
        //We got the succes response lets reload the tableview to update the UI
        [tblProjectWall reloadData];
        NSLog(@"dict %@",dict);
        
        
    }];
    [req setFailedBlock:^{
        NSLog(@"Service Failure");
    }];
    [req startAsynchronous];
    

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProjectWallModal *currModal = [projectWallModalsArray objectAtIndex:indexPath.row];
    if (currModal.isExpanded == TRUE) {
        return 200;
    }
    return 139;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [projectWallModalsArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
     
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ProjectWallCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ProjectWallCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }

    [cell setTableViewDelegate:self];
    [cell setRowIndex:indexPath.row];
    [cell setSectionIndex:indexPath.section];
    [cell loadCellValuesWithModal:[projectWallModalsArray objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)cellClickedWithIndexPathRow:(int)rowVal andSectionVal:(int)sectionVal{
    
//    NSArray *allVisibleCells = [tblProjectWall visibleCells];
//    for (ProjectWallCell *currentCell  in allVisibleCells) {
//       // NSLog(@"%@ is current Cell --- > %@ is indexpath",currentCell,[currentCell );
//    }
    [tblProjectWall reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
