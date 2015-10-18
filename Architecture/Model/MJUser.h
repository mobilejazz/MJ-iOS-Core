//
//  MJUser.h
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJUser : NSObject

@property (nonatomic, assign, readonly) NSInteger userId;
@property (nonatomic, copy, readonly) NSString *name;

@end
