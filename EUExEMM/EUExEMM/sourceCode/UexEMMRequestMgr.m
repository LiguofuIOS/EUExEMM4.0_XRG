//
//  UexEMMRequestMgr.m
//  UexEMMRequestMgr
//
//  Created by xrg on 15/8/24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "UexEMMRequestMgr.h"
#import "UexEMMUtility.h"
#import "BUtility.h"
#import "WidgetOneDelegate.h"

@interface UexEMMRequestMgr ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@end

@implementation UexEMMRequestMgr

#pragma mark - publish

- (id)initWithUexObj:(EUExEMM *)uexObj {
    
    if (self = [super init]) {
        
        self.uexObj = uexObj;
        _isCertificate = NO;
        
    }
    
    return self;
    
}

//post异步请求封装函数
- (void)post:(NSString *)URL RequestBodyParams:(NSString *)bodyParams RequestHeaders:(NSDictionary *)headers {
    
    NSURL *url = [NSURL URLWithString:URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:60.0];
    
    NSData *postData = [bodyParams dataUsingEncoding:NSUTF8StringEncoding];
    
    if (headers) {
        [request setAllHTTPHeaderFields:headers];
    }
    
    if ([[[url scheme] lowercaseString] isEqualToString:@"https"]) {
        NSLog(@"https");
    }
    
    
    
    [request addValue:@"varifyApp" forHTTPHeaderField:[UexEMMUtility md5Code:[UexEMMUtility getAppIdByUexObj:(EUExBase *)_uexObj] AppKey:[UexEMMUtility getAppKeyByUexObj:(EUExBase *)_uexObj]]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
//    NSURLConnection * urlConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
//    [urlConnection start];
    

    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(RequestMgr:didFailWithError:)]) {
        [self.delegate RequestMgr:self didFailWithError:error];
    }
    
}

//- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection {
//    NSLog(@"connectionShouldUseCredentialStorage");
//    return YES;
//}

- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        
        NSData * PKCS12Data = [NSData dataWithContentsOfFile:[BUtility clientCertficatePath]];
        
        
        if (_isCertificate){
            
            NSURLCredential * urlCredential = [UexEMMUtility getEMMLoginCACredential];
            [[challenge sender] useCredential:urlCredential forAuthenticationChallenge:challenge];

        } else if (PKCS12Data) {
            
            NSURLCredential * urlCredential = [UexEMMUtility getAppCanURLCredential];
            [[challenge sender] useCredential:urlCredential forAuthenticationChallenge:challenge];
            
        } else if ([challenge.sender respondsToSelector:@selector(performDefaultHandlingForAuthenticationChallenge:)]) {
            
            [challenge.sender performDefaultHandlingForAuthenticationChallenge:challenge];
            
        } else {
            
            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
            
        }
        
    } else {
        
        NSData * PKCS12Data = [NSData dataWithContentsOfFile:[BUtility clientCertficatePath]];
        
        if (_isCertificate){
            
            NSURLCredential * urlCredential = [UexEMMUtility getEMMLoginCACredential];
            [[challenge sender] useCredential:urlCredential forAuthenticationChallenge:challenge];
            
        } else if (PKCS12Data) {

            NSURLCredential * urlCredential = [UexEMMUtility getAppCanURLCredential];
            [[challenge sender] useCredential:urlCredential forAuthenticationChallenge:challenge];
            
        } else if ([challenge previousFailureCount] == 0) {
            
            [[challenge sender] continueWithoutCredentialForAuthenticationChallenge:challenge];
            
        } else {
            
            [[challenge sender] continueWithoutCredentialForAuthenticationChallenge:challenge];
            
        }
        
    }
    
}



//- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
//    NSLog(@"canAuthenticateAgainstProtectionSpace==>>%@",[protectionSpace description]);
//    return YES;
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//    NSLog(@"didReceiveAuthenticationChallenge==>>%@",[challenge description]);
//}
//
//- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//    NSLog(@"didCancelAuthenticationChallenge==>>%@",[challenge description]);
//}

#pragma mark - NSURLConnectionDataDelegate

//- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response {
//    
//    NSLog(@"response==>>%@",[response description]);
//    
//    return request;
//    
//}
//
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    self.responseData = [NSMutableData data];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(RequestMgr:didReceiveResponse:)]) {
        
        [self.delegate RequestMgr:self didReceiveResponse:response];
        
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [self.responseData appendData:data];
    
//    if (self.delegate && [self.delegate respondsToSelector:@selector(RequestMgr:didReceiveData:)]) {
//        
//        [self.delegate RequestMgr:self didReceiveData:data];
//        
//    }
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(RequestMgr:didFinishWithData:)]) {
        
        [self.delegate RequestMgr:self didFinishWithData:self.responseData];
        
    }
    
}

//
//- (NSInputStream *)connection:(NSURLConnection *)connection needNewBodyStream:(NSURLRequest *)request {
//    
//    return nil;
//    
//}
//
//- (void)connection:(NSURLConnection *)connection   didSendBodyData:(NSInteger)bytesWritten
// totalBytesWritten:(NSInteger)totalBytesWritten
//totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
//    
//}
//
//- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
//    return cachedResponse;
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    
//}



@end
