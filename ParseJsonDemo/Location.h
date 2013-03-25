//
//  Location.h
//  ParseJsonDemo
//
//  Created by wu liang on 3/25/13.
//  Copyright (c) 2013 wu liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Location : JSONModel
@property (strong, nonatomic) NSString* country_code;
@property (strong, nonatomic) NSString* country;
@end
