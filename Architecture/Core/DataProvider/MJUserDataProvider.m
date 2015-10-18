//
//  MJUserDataProvider.m
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJUserDataProvider.h"

@implementation MJUserDataProviderConfigurator

@end

@implementation MJUserDataProvider
{
    id <MJUserNetworkClient> _userNetworkClient;
    id <MJUserCacheClient> _userCacheClient;
    MJUserEntityMapper *_mapper;
}

- (id)initWithConfigurator:(void (^)(MJUserDataProviderConfigurator *configurator))configurationBlock
{
    self = [super init];
    if (self)
    {
        MJUserDataProviderConfigurator *configurator = [MJUserDataProviderConfigurator new];
        if (configurationBlock)
            configurationBlock(configurator);
        
        _userNetworkClient = configurator.networkClient;
        _userCacheClient = configurator.cacheClient;
        _mapper = configurator.mapper;
    }
    return self;
}

- (void)userWithCompletionBlock:(void (^)(MJUser *user, NSError *error))completionBlock
{
    [_userCacheClient fetchUserWithCompletionBlock:^(MJUserEntity *userEntity, NSError *error) {
        if (userEntity && !error)
        {
            if (completionBlock)
                completionBlock([_mapper userFromUserEntity:userEntity], nil);
        }
        else
        {
            [_userNetworkClient fetchUserWithCompletionBlock:^(MJUserEntity *userEntity, NSError *error) {
                if (!error)
                    [_userCacheClient saveUserEntity:userEntity completionBlock:nil];
                
                if (completionBlock)
                    completionBlock([_mapper userFromUserEntity:userEntity], error);
            }];
        }
    }];
}

- (void)setUser:(MJUser*)user completionBlock:(void (^)(NSError *error))completionBlock
{
    [_userNetworkClient saveUserEntity:[_mapper userEntityFromUser:user] completionBlock:^(NSError *error) {
        if (completionBlock)
            completionBlock(error);
    }];
}

- (void)invalidateUser:(MJUser*)user
{
    [_userCacheClient invalidateUserEntity:[_mapper userEntityFromUser:user]];
}

@end
