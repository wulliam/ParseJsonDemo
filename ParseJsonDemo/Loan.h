//
//  Loan.h
//  ParseJsonDemo
//
//  Created by wu liang on 3/25/13.
//  Copyright (c) 2013 wu liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Location.h"

@protocol Loan
@end
@interface Loan : JSONModel
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* use;
@property (strong, nonatomic) Location* location;
@end
