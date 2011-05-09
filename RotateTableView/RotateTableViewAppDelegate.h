//
//  RotateTableViewAppDelegate.h
//  RotateTableView
//
//  Created by Forrest Shi on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RotateTableViewViewController;

@interface RotateTableViewAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet RotateTableViewViewController *viewController;

@end
