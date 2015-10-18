//
//  MJApiService.m
//  Architecture
//
//  Created by Joan Martin on 18/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJApiService.h"

@implementation MJApiService

- (id)initWithRequestExecutor:(id<MJApiRequestExecutor>)executor
{
    self = [super init];
    if (self)
    {
        _requestExecutor = executor;
    }
    return self;
}

@end
