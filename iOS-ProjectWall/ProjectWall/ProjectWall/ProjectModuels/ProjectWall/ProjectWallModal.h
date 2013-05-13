//
//  ProjectWallModal.h
//  ProjectWall
//
//  Created by Banu Chander on 5/13/13.
//  Copyright (c) 2013 Banu Chander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectWallModal : NSObject
{
    
    NSString *commentCount;
    NSString *description;
    NSString *projectId;
    NSString *imageLink;
    NSString *imageLinkBucket;
    NSString *imageLinkId;
    NSString *imageLinkRepo;
    NSString *postTime;
    NSString *selfLink;
    NSString *titleVal;
    NSString *type;
    NSString *uniqueId;
    BOOL isExpanded;
}

@property(nonatomic,retain)NSString *commentCount;
@property(nonatomic,retain)NSString *description;
@property(nonatomic,retain)NSString *projectId;
@property(nonatomic,retain)NSString *imageLink;
@property(nonatomic,retain)NSString *imageLinkBucket;
@property(nonatomic,retain)NSString *imageLinkId;
@property(nonatomic,retain)NSString *imageLinkRepo;
@property(nonatomic,retain)NSString *postTime;
@property(nonatomic,retain)NSString *selfLink;
@property(nonatomic,retain)NSString *titleVal;
@property(nonatomic,retain)NSString *type;
@property(nonatomic,retain)NSString *uniqueId;
@property(nonatomic,readwrite)BOOL isExpanded;

@end


