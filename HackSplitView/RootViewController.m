//
//  RootViewController.m
//  HackSplitView
//
//  Created by Forrest Shi on 5/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "DetailViewController.h"

#import "SinaBlog.h"
#import "FeedsTableViewController.h"


static NSString *HANHAN_BLOG = @"http://blog.sina.com.cn/rss/1191258123.xml";
static NSString *TEST_RSS = @"http://building43.com/feed";
static NSString *WANG_BLOG = @"http://blog.sina.com.cn/rss/1273972353.xml";

@implementation RootViewController
		

@synthesize bloggerList;
@synthesize detailViewController;


- (void) loadView{
    [super loadView];
    
    if (!bloggerList) {
        bloggerList = [[NSMutableArray alloc] init ];
        
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"BloggerList" ofType:@"plist"];
        NSDictionary *bloggerDict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
        NSLog(@"%@",bloggerDict);
        
        NSArray* blogArray = [bloggerDict allValues];
        for (id item in blogArray) {
            SinaBlog *blog =  [[[SinaBlog alloc] init] autorelease];
            blog.title = [item objectForKey:@"Title"];
            blog.link = [item objectForKey:@"Link"];
            [bloggerList addObject:blog];
        }
        
        NSLog(@"%@",bloggerList);
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    
    
    

    
}

		
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    		
}

		
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [bloggerList count];
    
}

		
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    SinaBlog *item = (SinaBlog*)[bloggerList objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

+ (CGFloat) findLabelHeight:(NSString*) text font:(UIFont *)font label:(UILabel *)label {
    CGSize textLabelSize = CGSizeMake(label.frame.size.width, 9000.0f);
    CGSize stringSize = [text sizeWithFont:font constrainedToSize:textLabelSize lineBreakMode:UILineBreakModeWordWrap];
    return stringSize.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    
    SinaBlog *item = (SinaBlog*)[bloggerList objectAtIndex:indexPath.row];
 
    FeedsTableViewController *feedsTVC = [[FeedsTableViewController alloc] initWithLink: item.link];
    feedsTVC.detailViewController = self.detailViewController;
    [self.navigationController pushViewController:feedsTVC animated:YES];
    [feedsTVC release];
 
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [detailViewController release];
    [bloggerList release];
    [super dealloc];
}

@end
