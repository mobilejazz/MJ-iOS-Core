//
//  MJInteractor.h
//  Architecture
//
//  Created by Joan Martin on 16/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJAsyncSerializerQueue : NSObject

- (void)performBlock:(void (^)())block;

- (void)finish;

@end

