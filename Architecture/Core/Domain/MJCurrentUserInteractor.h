//
//  MJCurrentUserInteractor.h
//  Architecture
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJUser.h"
#import "MJUserDataProvider.h"

@interface MJCurrentUserInteractor : NSObject

- (id)initWithUserDataProvider:(MJUserDataProvider*)userDataProvider;

- (void)execute:(void(^)(MJUser *user, NSError *error))completionBlock;

@end
