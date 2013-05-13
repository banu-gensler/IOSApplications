//
//  HomeViewController.m
//  ProjectWall
//
//  Created by Banu Chander on 5/9/13.
//  Copyright (c) 2013 Banu Chander. All rights reserved.
//

#import "HomeViewController.h"
#import "ProjectWallViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
      
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)pushNewViewController:(id)sender{
    
    ProjectWallViewController *pViewController = [[ProjectWallViewController alloc]initWithNibName:@"ProjectWallViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:pViewController animated:YES];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
