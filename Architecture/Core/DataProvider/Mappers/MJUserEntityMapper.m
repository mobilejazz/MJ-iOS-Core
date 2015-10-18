//
//  MJUserEntityMapper.m
//  Architecture
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJUserEntityMapper.h"

#import "MJUser_Private.h"
#import "MJUserEntity.h"

@implementation MJUserEntityMapper

- (MJUser*)userFromUserEntity:(MJUserEntity*)userEntity
{
    MJUser *user = [[MJUser alloc] init];
    
    user.userId = userEntity.userId;
    user.name = userEntity.name;
    
    return user;
}

- (MJUserEntity*)userEntityFromUser:(MJUser*)user
{
    MJUserEntity *entity = [[MJUserEntity alloc] init];
    
    entity.userId = user.userId;
    entity.name = user.name;
    
    return entity;
}

@end
