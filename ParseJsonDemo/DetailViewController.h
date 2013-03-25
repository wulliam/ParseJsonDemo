//
//  DetailViewController.h
//  ParseJsonDemo
//
//  Created by wu liang on 3/25/13.
//  Copyright (c) 2013 wu liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loan.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Loan* detailItem;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@end
