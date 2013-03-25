//
//  ClientApi.m
//  ParseJsonDemo
//
//  Created by wu liang on 3/25/13.
//  Copyright (c) 2013 wu liang. All rights reserved.
//

#import "ClientApi.h"
#import "JSONModel.h"
#import "KivaFeed.h"
#import "HUD.h"
#import "JSONHTTPClient.h"

@implementation ClientApi
KivaFeed* _feed;
static ClientApi* clientApi;

+(void)initialize
{
    static BOOL initialized = NO;
    if (!initialized) {
        initialized = YES;
        clientApi = [ClientApi new];
    }
}

+(ClientApi*)getInstance
{
    return clientApi;
}

-(KivaFeed*) fetchFeed
{
    
    if (self.kivaFeed == nil)
    {
        [JSONHTTPClient getJSONFromURLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising" completion:^(NSDictionary *json, JSONModelError* err) {
            NSLog(@"json  %d", json.count);
            self.kivaFeed = [[KivaFeed alloc] initWithDictionary:json error:&err];
        }];
        
    }
    NSLog(@"kivaFeed %@", self.kivaFeed);
    return self.kivaFeed;

}
@end
