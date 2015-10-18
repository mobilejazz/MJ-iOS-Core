//
//  MJUserEntity.m
//  Architecture
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJUserEntity.h"

#import <Motis/Motis.h>

@implementation MJUserEntity

+ (NSDictionary*)mts_mapping
{
    return @{@"id": mts_key(userId),
             @"name": mts_key(name),
             };
}

@end
