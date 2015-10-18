//
//  MJAppManager.h
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJUserDataProvider.h"

@interface MJAppManager : NSObject

+ (MJAppManager*)sharedInstance;

/** ************************************************************ **
 * @name Data Providers
 ** ************************************************************ **/

@property (nonatomic, strong, readonly) MJUserDataProvider *userDataProvider;

@end
