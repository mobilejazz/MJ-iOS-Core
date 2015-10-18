//
//  NSUserDefaults+User.m
//  Architecture
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJUserUserDefaults.h"

#import "MJUserEntity.h"

static NSString * const MJUserCurrentUserNameKey = @"com.domain.cache.user.name.current";
static NSString * const MJUserCurrentUserIdKey = @"com.domain.cache.user.id.current";

@implementation MJUserUserDefaults

- (void)fetchUserWithCompletionBlock:(void (^)(MJUserEntity *, NSError *))completionBlock
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    MJUserEntity *userEntity = [[MJUserEntity alloc] init];
    [userEntity setValue:@([userDefaults integerForKey:MJUserCurrentUserIdKey]) forKey:@"userId"];
    [userEntity setValue:[userDefaults objectForKey:MJUserCurrentUserNameKey] forKey:@"name"];
    
    if (completionBlock)
        completionBlock(userEntity, nil);
}

- (void)saveUserEntity:(MJUserEntity *)userEntity completionBlock:(void (^)(NSError *))completionBlock
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setInteger:userEntity.userId forKey:MJUserCurrentUserIdKey];
    [userDefaults setObject:userEntity.name forKey:MJUserCurrentUserNameKey];
    [userDefaults synchronize];
    
    if (completionBlock)
        completionBlock(nil);
}

- (void)invalidateUserEntity:(MJUserEntity *)userEntity
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:MJUserCurrentUserNameKey];
    [userDefaults removeObjectForKey:MJUserCurrentUserIdKey];
    [userDefaults synchronize];
}

@end
