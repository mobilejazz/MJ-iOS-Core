//
//  MJApiDirector+User.h
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJApiService.h"

#import "MJUserNetworkClient.h"

@interface MJApiUserService : MJApiService <MJUserNetworkClient>

@end
