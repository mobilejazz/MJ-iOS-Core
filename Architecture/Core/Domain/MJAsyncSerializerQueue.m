//
//  MJInteractor.m
//  Architecture
//
//  Created by Joan Martin on 16/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJAsyncSerializerQueue.h"

@implementation MJAsyncSerializerQueue
{
    NSOperationQueue *_operationQueue;
    dispatch_semaphore_t _semaphore;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _operationQueue = [[NSOperationQueue alloc] init];
        _operationQueue.maxConcurrentOperationCount = 1;
    }
    return self;
}

- (void)performBlock:(void (^)())block
{
    [_operationQueue addOperationWithBlock:^{
        _semaphore = dispatch_semaphore_create(0);
        block();
        dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
        _semaphore = nil;
    }];
}

- (void)finish
{
    dispatch_semaphore_signal(_semaphore);
}

@end
