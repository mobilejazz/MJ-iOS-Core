//
//  MJAppManager.m
//  ArchitectureSample
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "MJAppManager.h"

#import "MJUserEntityMapper.h"
#import "MJUserUserDefaults.h"
#import "MJApiUserService.h"

#import <MJApiClient/MJApiSession.h>

@interface MJAppManager () <MJApiClientDelegate>

@end

@implementation MJAppManager
{
    MJApiSession *_apiSession;
}

+ (MJAppManager*)sharedInstance
{
    static MJAppManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MJAppManager alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        MJApiClient *apiClient = [[MJApiClient alloc] initWithConfigurator:^(MJAPiClientConfigurator *configurator) {
            configurator.host = @"http://mobilejazz.com";
            configurator.apiPath = @"/api/v1";
            configurator.cacheManagement = MJApiClientCacheManagementDefault;
        }];
        
        apiClient.delegate = self;
        
        _apiSession = [[MJApiSession alloc] initWithConfigurator:^(MJApiSessionConfigurator *configurator) {
            configurator.apiClient = apiClient;
            configurator.apiOAuthPath = @"/api/v1/oauth/token";
            configurator.clientId = @"client-id";
            configurator.clientSecret = @"client-secret";
        }];
        
        [self mjz_initProviders];
    }
    return self;
}

- (void)mjz_initProviders
{
    _userDataProvider = [[MJUserDataProvider alloc] initWithConfigurator:^(MJUserDataProviderConfigurator *configurator) {
        configurator.networkClient = [[MJApiUserService alloc] initWithRequestExecutor:_apiSession];
        configurator.cacheClient = [[MJUserUserDefaults alloc] init];
        configurator.mapper = [[MJUserEntityMapper alloc] init];
    }];
    
    // Init providers here
}

#pragma mark - Protocols
#pragma mark MJApiClientDelegate

- (NSError*)apiClient:(MJApiClient *)apiClient errorForResponseBody:(NSDictionary *)responseBody incomingError:(NSError *)error
{
    return error;
}

- (void)apiClient:(MJApiClient *)apiClient didReceiveErrorInResponse:(MJApiResponse *)response
{
    NSLog(@"RECEIVED ERROR: %@", response.error);
}

@end
