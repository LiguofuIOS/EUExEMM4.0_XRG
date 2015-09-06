//
//  UexEMMUtility.h
//  UexEMMUtility
//
//  Created by xrg on 15/8/24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UexEMMConfig.h"
#import "EUExBase.h"
#import "WWidget.h"


#import "OpenUDID.h"
#import "JSON.h"

//#import "GTMBase64.h"
//#include <sys/socket.h>
//#include <sys/sysctl.h>
//#include <net/if.h>
//#include <net/if_dl.h>
//#import <CoreTelephony/CTTelephonyNetworkInfo.h>
//#import <Security/Security.h>
//#import <CoreTelephony/CTCarrier.h>
//#import <CommonCrypto/CommonDigest.h>
//#import <netdb.h>
//#import <objc/runtime.h>
//#import <objc/message.h>

@interface UexEMMUtility : NSObject

@property (nonatomic, copy) NSString *appKey;

+ (NSURLCredential *)getCredentialWithPath:(NSString *)path password:(NSString *)password;

+ (NSURLCredential *)getAppCanURLCredential;

+ (NSURLCredential *)getEMMLoginCACredential;

+ (NSString *)md5Code:(NSString *)appId AppKey:(NSString *)appKey;

+ (NSString *)getAppIdByUexObj:(EUExBase *)uexObj;

+ (NSString *)getAppKeyByUexObj:(EUExBase *)uexObj;

+ (NSString *)getJsonString:(NSInteger)tag;

+ (void)setAccessToken:(NSString *)accessToken forAppId:(NSString *)appId;

+ (NSString *)getAccessTokenForAppId:(NSString *)appId;

+ (void)removeAccessTokenForAppId:(NSString *)appId;

+ (NSString *)getWidgetInfoByUexObj:(EUExBase *)uexObj;

+ (NSMutableDictionary*)wgtParameters:(NSString*)inFileName;

+ (WWidget *)dictToWgt:(NSMutableDictionary *)inDict;

+ (NSString *)getModel;

+ (NSString *)getOSVersion;

+ (NSString *)getScreenSize;

+ (NSString *)getCarrier;

+ (NSString *)getConnectStatus;

+ (NSString *)nowTime;

+ (NSString *)md5CodeWithAppId:(NSString *)appId appKey:(NSString *)appKey;





+ (NSString *)macAddress;

//+(NSString*)getIpAddress;
//+(NSString*)getHardwareSys;
//+(NSString*)getOSVersion;
+ (NSString *)getUUID;
//+(NSString*)getScreen;
//+(NSString*)getCarrier;
//+(NSString *)nowTime;
//+(BOOL) isConnected;
//+(NSString *)getConnectStatus;
//
//+(void)writeLog:(NSString*)inLog fileName:(NSString*)inLogFile;
//+(void)deleteLog:(NSString*)inLogFile;
//+(NSString*)readLog:(NSString*)inLogFile;
//
////error
////+ (void)setDefaultHandler;
////+ (NSUncaughtExceptionHandler*)getHandler;
//
//+(void)deleteUserData;
//+(void)deleteChildUserDataWithAppId:(NSString *)appId;
//
//+(void)saveWidgetInfoToPlistWithAppKey:(NSString *)appkey appId:(NSString *)appId;
//+(void)deleteWidgetInfoToPlistWithAppKey:(NSString *)appkey;
//+(NSArray *)getWidgetInfoFromPlist;
//+(NSString *)generateReportFileNameWithAppkey:(NSString *)appkey;
//+(NSString *)getAppKeyWithAppId:(NSString *)appid;

+ (NSString *)getUexEMMCBJsonStringWithTag:(int)tag;

@end
