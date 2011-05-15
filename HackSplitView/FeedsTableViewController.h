//
//  FeedsTableViewController.h
//  RSSDemo
//
//  Created by forrest on 11-5-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface FeedsTableViewController : UITableViewController {
    NSMutableArray  *feedsArray;
    DetailViewController *detailViewController;
}

@property(nonatomic,retain) NSMutableArray  *feedsArray;
@property (nonatomic, retain)  DetailViewController *detailViewController;

- (id)initWithLink:(NSString*)link;

@end
