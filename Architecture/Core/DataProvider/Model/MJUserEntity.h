//
//  MJUserEntity.h
//  Architecture
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJUserEntity : NSObject

@property (nonatomic, assign, readwrite) NSInteger userId;
@property (nonatomic, copy, readwrite) NSString *name;

@end
