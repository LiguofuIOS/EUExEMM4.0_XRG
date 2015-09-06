//
//  UexEMMRequestMgr.h
//  UexEMMRequestMgr
//
//  Created by xrg on 15/8/24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EUExEMM;
@class UexEMMRequestMgr;


@protocol UexEMMRequestMgrDelegate <NSObject>

- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didReceiveResponse:(NSURLResponse *)response;
//- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didReceiveData:(NSData *)data;
- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didFailWithError:(NSError *)error;
- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didFinishWithData:(NSData *)data;


@end


@interface UexEMMRequestMgr : NSObject

@property (nonatomic, assign)   id <UexEMMRequestMgrDelegate>   delegate;

@property (nonatomic, weak) EUExEMM * uexObj;

@property (nonatomic, copy) NSString * identifier;

@property (nonatomic, strong)NSMutableData *responseData;

@property (nonatomic, assign)BOOL isCertificate;

- (id)initWithUexObj:(EUExEMM *)uexObj;

- (void)post:(NSString *)URL RequestBodyParams:(NSString *)bodyParams RequestHeaders:(NSDictionary *)headers;

@end
