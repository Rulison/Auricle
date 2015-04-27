//
//  LibraryViewController.h
//  TestPage
//
//  Created by MAC Book on 4/25/15.
//  Copyright (c) 2015 MAC Book. All rights reserved.
//

#ifndef TestPage_LibraryViewController_h
#define TestPage_LibraryViewController_h

#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"
#import "IntervalsLibraryViewController.h"

@interface LibraryViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *intervalsButton;

@property (strong, nonatomic) id dataObject;

@end

#endif
