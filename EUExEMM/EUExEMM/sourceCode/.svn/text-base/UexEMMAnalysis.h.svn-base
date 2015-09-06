//
//  UexEMMAnalysis.h
//  EUExEMM
//
//  Created by liguofu on 15/9/2.
//  Copyright (c) 2015年 liguofu. All rights reserved.
//

@class EUExEMM;

#import <Foundation/Foundation.h>
#import "UexEMMUtility.h"
#import "EUtility.h"


//#import "GTMBase64.h"
//#include <sys/socket.h>
//#include <sys/sysctl.h>
//#include <net/if.h>
//#include <net/if_dl.h>
//#import <CoreTelephony/CTTelephonyNetworkInfo.h>
//#import <Security/Security.h>
//#import <CoreTelephony/CTCarrier.h>
#import <CommonCrypto/CommonDigest.h>
//#import <netdb.h>
//#import <objc/runtime.h>
//#import <objc/message.h>

@interface UexEMMAnalysis : NSObject

@property (nonatomic, copy) NSString *softToken;

@property (nonatomic, copy) NSString *appKey;

@property (nonatomic, retain) NSString *md5LoginName;

@property (nonatomic, weak) EUExEMM * uexObj;

@property (nonatomic, copy) NSString *wgtTempPathCA;

/**
 * 获取单例对象
 *
 **/
+ (UexEMMAnalysis *)ACInstance;


- (void)initWithUexObj:(EUExEMM *)uexObj;

/**
 * 获取md5SoftToken
 *
 */
- (NSString *)md5SoftToken;

/**
 * 获取子widget的appkey
 *
 */
- (NSString *)getAppKey;

/**
 * request请求的header
 *
 **/
- (NSString*)md5Code:(NSString *)appId AppKey:(NSString *)appKey time:(NSTimeInterval)timeSince1970;

/**
 * 根据EUExEMM的登录名加密
 *
 **/
- (NSString *)getMd5LoginName:(NSString *)loginName;

//add appId;
- (void)setAppId:(NSString* )inAppId;

@end
