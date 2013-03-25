//
//  KivaFeed.h
//  ParseJsonDemo
//
//  Created by wu liang on 3/25/13.
//  Copyright (c) 2013 wu liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Loan.h"

@interface KivaFeed : JSONModel

@property (strong, nonatomic) NSArray<Loan>* loans;

@end
