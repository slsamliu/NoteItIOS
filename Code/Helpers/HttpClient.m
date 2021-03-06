//
// Created by Bruno Wernimont on 2013
// Copyright 2013 NoteIT
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "HttpClient.h"

#import "AppDelegate.h"
#import "AFNetworking.h"

#import "List.h"
#import "Note.h"
#import "User.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HttpClient ()

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HttpClient


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    }
    return self;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSURL *)baseURL {
    return [NSURL URLWithString:API_BASE_URL];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)path {
    return API_PATH;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDictionary *)params {
    if ([User isLoggedIn]) {
        return [NSDictionary dictionaryWithObject:[[User shared] accessToken] forKey:@"access_token"];
    }
    
    return nil;
}


@end
