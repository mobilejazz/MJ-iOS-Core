//
//  MJApiDirector+User.m
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJApiUserService.h"

#import <Motis/Motis.h>
#import "MJUserEntity.h"

#import <MJApiClient/MJApiResponse.h>

@implementation MJApiUserService

- (void)fetchUserWithCompletionBlock:(void (^)(MJUserEntity *, NSError *))completionBlock
{
    MJApiRequest *request = [MJApiRequest requestWithPath:@"user/me"];
    
    [self.requestExecutor performRequest:request completionBlock:^(MJApiResponse *response) {
        
        MJUserEntity *user = nil;
        
        if (!response.error)
        {
            user = [[MJUserEntity alloc] init];
            [user mts_setValuesForKeysWithDictionary:response.responseObject];
        }
        
        if (completionBlock)
            completionBlock(user, nil);
    }];
}

- (void)saveUserEntity:(MJUserEntity *)userEntity completionBlock:(void (^)(NSError *))completionBlock
{
    MJApiRequest *request = [MJApiRequest requestWithPath:@"user/me"];
    request.httpMethod = HTTPMethodPOST;
    request.parameters = @{@"user_name": userEntity.name};
    
    [self.requestExecutor performRequest:request completionBlock:^(MJApiResponse *response) {
        if (completionBlock)
            completionBlock(nil);
    }];
}

@end
