//
//  MJUserNetwork.h
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MJUserEntity;

@protocol MJUserNetworkClient <NSObject>

- (void)fetchUserWithCompletionBlock:(void (^)(MJUserEntity *user, NSError *error))completionBlock;
- (void)saveUserEntity:(MJUserEntity*)userEntity completionBlock:(void (^)(NSError *error))completionBlock;

@end
