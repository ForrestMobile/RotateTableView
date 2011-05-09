//
//  RotateTableViewViewController.m
//  RotateTableView
//
//  Created by Forrest Shi on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RotateTableViewViewController.h"
#import "MyTableViewCell.h"

@implementation RotateTableViewViewController

- (void)dealloc
{
    [myArray release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)loadView{
    [super loadView];
    
    if (!myArray) {
        myArray = [[NSMutableArray alloc] init];
        [myArray addObject:@"Test"];
        [myArray addObject:@"Scond"];
        for (int i = 0; i < 100; i++) {
            [myArray addObject:[NSString stringWithFormat:@"String %d",i]];
        }
    }
    
    tableView.rowHeight = 300;
    tableView.contentMode = UIViewContentModeScaleToFill;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    CGAffineTransform transform = CGAffineTransformMakeRotation(-1.57f);
    tableView.transform = transform;
    tableView.frame = CGRectMake(0, 100, 320, 200);
    tableView.pagingEnabled = YES;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//add required interface for data source delegate 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [myArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
//    UITableViewCell *cell = nil; //[[MyTableViewCell alloc] init]; //initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
//    
//    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:self options:nil];
//    cell = [views objectAtIndex:0];
//    
//    //cell.textLabel.text = [myArray objectAtIndex:indexPath.row];
//    cell.transform = CGAffineTransformMakeRotation(1.57f);
//    
//    return cell;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell"];
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
        //cell.frame = CGRectMake(0, 100, 100, 100);
        cell.transform = CGAffineTransformMakeRotation(1.57f);
    }
    
    return cell;
    
}

@end
