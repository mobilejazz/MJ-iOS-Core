//
//  MJUserDataProvider.h
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJUserNetworkClient.h"
#import "MJUserCacheClient.h"
#import "MJUserEntityMapper.h"

@class MJUser;

@interface MJUserDataProviderConfigurator : NSObject

@property (nonatomic, strong) id <MJUserNetworkClient> networkClient;
@property (nonatomic, strong) id <MJUserCacheClient> cacheClient;
@property (nonatomic, strong) MJUserEntityMapper *mapper;

@end


@interface MJUserDataProvider : NSObject

/** ************************************************************ **
 * @name Initializers
 ** ************************************************************ **/

- (id)initWithConfigurator:(void (^)(MJUserDataProviderConfigurator *configurator))configurationBlock;

/** ************************************************************ **
 * @name Methods
 ** ************************************************************ **/

- (void)userWithCompletionBlock:(void (^)(MJUser *user, NSError *error))completionBlock;

- (void)setUser:(MJUser*)user completionBlock:(void (^)(NSError *error))completionBlock;

- (void)invalidateUser:(MJUser*)user;

@end
