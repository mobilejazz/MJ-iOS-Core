//
//  MJUserCacheProvider.h
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MJUserEntity;

@protocol MJUserCacheClient <NSObject>

- (void)fetchUserWithCompletionBlock:(void (^)(MJUserEntity *userEntity, NSError *error))completionBlock;
- (void)saveUserEntity:(MJUserEntity*)user completionBlock:(void (^)(NSError *error))completionBlock;
- (void)invalidateUserEntity:(MJUserEntity*)userEntity;

@end
