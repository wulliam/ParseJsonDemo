//
//  ClientApi.h
//  ParseJsonDemo
//
//  Created by wu liang on 3/25/13.
//  Copyright (c) 2013 wu liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KivaFeed.h"

@interface ClientApi : NSObject
@property (strong, nonatomic) KivaFeed* kivaFeed;

+(void)initialize;
+(ClientApi*)getInstance;

-(KivaFeed*) fetchFeed;
@end
