//
//  MJApiService.h
//  Architecture
//
//  Created by Joan Martin on 18/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MJApiClient/MJApiRequestExecutor.h>

@interface MJApiService : NSObject

- (id)initWithRequestExecutor:(id <MJApiRequestExecutor>)executor;

@property (nonatomic, strong, readonly) id <MJApiRequestExecutor> requestExecutor;

@end
