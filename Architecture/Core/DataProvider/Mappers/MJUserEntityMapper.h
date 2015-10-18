//
//  MJUserEntityMapper.h
//  Architecture
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MJUser;
@class MJUserEntity;

@interface MJUserEntityMapper : NSObject

- (MJUser*)userFromUserEntity:(MJUserEntity*)userEntity;

- (MJUserEntity*)userEntityFromUser:(MJUser*)user;

@end
