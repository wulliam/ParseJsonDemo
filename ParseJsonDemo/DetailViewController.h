//
//  DetailViewController.h
//  ParseJsonDemo
//
//  Created by wu liang on 3/25/13.
//  Copyright (c) 2013 wu liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
