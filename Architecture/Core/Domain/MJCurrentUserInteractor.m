//
//  MJCurrentUserInteractor.m
//  Architecture
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJCurrentUserInteractor.h"
#import "MJAsyncSerializerQueue.h"


@implementation MJCurrentUserInteractor
{
    MJUserDataProvider *_userDataProvider;
    MJAsyncSerializerQueue *_serializerQueue;
}

- (id)initWithUserDataProvider:(MJUserDataProvider*)userDataProvider
{
    self = [super init];
    if (self)
    {
        _userDataProvider = userDataProvider;
    }
    return self;
}

- (void)execute:(void(^)(MJUser *user, NSError *error))completionBlock
{
    [_serializerQueue performBlock:^{
        [_userDataProvider userWithCompletionBlock:^(MJUser *user, NSError *error) {
            [_serializerQueue finish];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completionBlock)
                    completionBlock(user, error);
            });
        }];
    }];
}

@end
