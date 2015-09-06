//
//  UexEMMUtility.m
//  UexEMMUtility
//
//  Created by xrg on 15/8/24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "UexEMMUtility.h"
#import "BUtility.h"
#import "WidgetOneDelegate.h"
#import "EBrowserView.h"
#import "AllConfigParser.h"
#import "FileEncrypt.h"
#import "EUtility.h"

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <Security/Security.h>
#import <CoreTelephony/CTCarrier.h>
#import <CommonCrypto/CommonDigest.h>
#import <netdb.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <SystemConfiguration/SystemConfiguration.h>


@implementation UexEMMUtility

+ (NSURLCredential *)getEMMLoginCACredential {
    
    return [UexEMMUtility getCredentialWithPath:[[NSUserDefaults standardUserDefaults] objectForKey:@"caSavePath"] password:[[NSUserDefaults standardUserDefaults] objectForKey:@"certPwd"]];

}


+ (NSURLCredential *)getAppCanURLCredential {
    
    return [UexEMMUtility getCredentialWithPath:[BUtility clientCertficatePath] password:theApp.useCertificatePassWord];
    
}

+ (NSURLCredential *)getCredentialWithPath:(NSString *)path password:(NSString *)password {
    
    SecIdentityRef identity = NULL;
    SecTrustRef trust = NULL;
    SecCertificateRef certChain=NULL;
    
    NSData *PKCS12Data = [NSData dataWithContentsOfFile:path];
    
    [BUtility extractIdentity:password andIdentity:&identity andTrust:&trust  andCertChain:&certChain fromPKCS12Data:PKCS12Data];
    
    NSArray * certificates = [NSArray arrayWithObject:(__bridge id)(certChain)];
    
    NSURLCredential * urlCredential = [NSURLCredential credentialWithIdentity:identity certificates:certificates persistence:NSURLCredentialPersistencePermanent];
    return urlCredential;
    
}

//request请求的header
+ (NSString *)md5Code:(NSString *)appId AppKey:(NSString *)appKey {
    
    unsigned long long time = [[NSDate date]timeIntervalSince1970] * 1000;
    
    NSString * md5StrIn = [NSString stringWithFormat:@"%@:%@:%lld",appId,appKey,time];
    
    NSData * md5Data = [md5StrIn dataUsingEncoding:NSUTF8StringEncoding];
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    
    CC_MD5_Update(&md5, [md5Data bytes], (int)[md5Data length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    
    NSString * md5Str = [NSString stringWithFormat:
                        @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                        digest[0], digest[1], digest[2], digest[3],
                        digest[4], digest[5], digest[6], digest[7],
                        digest[8], digest[9], digest[10], digest[11],
                        digest[12], digest[13], digest[14], digest[15]];
    
    NSString * verifyApp = [NSString stringWithFormat:@"%@;%lld",[md5Str lowercaseString],time];
    
    return verifyApp;
}

+ (NSString *)getAppIdByUexObj:(EUExBase *)uexObj {
    
    return uexObj.meBrwView.mwWgt.appId;
    
}

+ (NSString *)getAppKeyByUexObj:(EUExBase *)uexObj {
    
    return uexObj.meBrwView.mwWgt.appKey?uexObj.meBrwView.mwWgt.appKey:uexObj.meBrwView.mwWgt.widgetOneId;
    
}

+ (NSString *)getJsonString:(NSInteger)tag {
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    switch (tag) {
            
        case 0:
        {
            [dict setObject:KUEX_STATUSVALUET forKey:KUEX_STATUSKEY];
            [dict setObject:KUEX_INFOVALUET forKey:KUEX_INFOKEY];
        }
            break;
        case 1:
        {
            [dict setObject:KUEX_STATUSVALUEF forKey:KUEX_STATUSKEY];
            [dict setObject:KUEX_INFOVALUEF forKey:KUEX_INFOKEY];
        }
            break;
        case 2:
        {
            [dict setObject:KUEX_ERROR_DESCRIBE_ARGS forKey:KUEX_INFOKEY];
            [dict setObject:KUEX_STATUSVALUEF forKey:KUEX_STATUSKEY];
        }
            break;
        case 3:
        {
            [dict setObject:kUEX_ERROR_DESCRIBE_FILE_EXIST forKey:KUEX_INFOKEY];
            [dict setObject:KUEX_STATUSVALUEF forKey:KUEX_STATUSKEY];
        }
            break;
            
    }
    
    return [dict JSONFragment];
    
}

+ (void)setAccessToken:(NSString *)accessToken forAppId:(NSString *)appId {
    
    [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:[NSString stringWithFormat:@"accessToken_%@",appId]];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+ (NSString *)getAccessTokenForAppId:(NSString *)appId {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"accessToken_%@",appId]];
    
}

+ (void)removeAccessTokenForAppId:(NSString *)appId {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithFormat:@"accessToken_%@",appId]];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+ (NSString *)getWidgetInfoByUexObj:(EUExBase *)uexObj {
    
    WWidget * curWgt = uexObj.meBrwView.mwWgt;
    
    if (!curWgt) {
        return nil;
    }
    
    NSString *appId = curWgt.appId?curWgt.appId:@"";
    
    NSString * ver = curWgt.ver?curWgt.ver:@"";
    
    NSString * channelCode = curWgt.channelCode?curWgt.channelCode:@"";
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [dict setObject:appId forKey:@"appId"];
    [dict setObject:ver forKey:@"version"];
    [dict setObject:channelCode forKey:@"channelCode"];
    
    return [dict JSONFragment];
        
}

+ (NSMutableDictionary*)wgtParameters:(NSString*)inFileName {
    //获得了当地的xml配置文件信息，得到字典
    
    NSMutableDictionary *xmlDict =nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:inFileName]) {
        NSData *configData = [NSData dataWithContentsOfFile:inFileName];
        AllConfigParser *configParser=[[AllConfigParser alloc]init];
        
        BOOL isEncrypt = [FileEncrypt isDataEncrypted:configData];
        
        if (isEncrypt) {
            
            NSURL *url = nil;
            if ([inFileName hasSuffix:@"file://"]) {
                url = [BUtility stringToUrl:inFileName];;
            } else {
                url = [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", inFileName]];
            }
            
            FileEncrypt *encryptObj = [[FileEncrypt alloc]init];
            NSString *data = [encryptObj decryptWithPath:url appendData:nil];
            
            configData = [data dataUsingEncoding:NSUTF8StringEncoding];
        }
        
        
        NSMutableDictionary * tmpDict =[configParser initwithReqData:configData];
        xmlDict = [NSMutableDictionary dictionaryWithDictionary:tmpDict];
        //
        [tmpDict removeAllObjects];
    }
    
    return xmlDict;
    
}

+ (WWidget *)dictToWgt:(NSMutableDictionary *)inDict {
    NSMutableDictionary *tmpDict =[NSMutableDictionary dictionaryWithDictionary:inDict];
    
    WWidget *tmpWgt = [[WWidget alloc]init];
    //widgetId  2
    NSString *tmpWId = [tmpDict objectForKey:CONFIG_TAG_WIDGETID];
    if (tmpWId) {
        tmpWgt.widgetId = tmpWId;
    }
    //widgetOneId 1
    NSString *tmpWoId = [tmpDict objectForKey:CONFIG_TAG_WIDGETONEID];
    if (tmpWoId) {
        tmpWgt.widgetOneId = tmpWoId;
    }
    //appId 3
    NSString *tmpAppId = [[tmpDict objectForKey:CONFIG_TAG_WIDGET] objectForKey:CONFIG_TAG_APPID];
    if (tmpAppId) {
        tmpWgt.appId =tmpAppId;
    }
    //ver 4
    NSString *tmpVer = [[tmpDict objectForKey:CONFIG_TAG_WIDGET] objectForKey:CONFIG_TAG_VERSION];
    if (tmpVer) {
        tmpWgt.ver = tmpVer;
    }
    //channel 5
    NSString *tmpChannelCode = [[tmpDict objectForKey:CONFIG_TAG_WIDGET] objectForKey:CONFIG_TAG_CHANNELCODE];
    if (tmpChannelCode) {
        tmpWgt.channelCode =tmpChannelCode;
    }
    //imei 6
    tmpWgt.imei = [BUtility getDeviceIdentifyNo];
    
    //widgetName 8
    NSString *tmpName= [tmpDict objectForKey:CONFIG_TAG_NAME];
    if (tmpName) {
        tmpWgt.widgetName = tmpName;
    }
    //widgetPath
    NSString *wgtPath = [tmpDict objectForKey:CONFIG_TAG_WIDGETPATH];
    tmpWgt.widgetPath = wgtPath;
    //indexUrl 11
    NSString *indexStr =[[tmpDict objectForKey:CONFIG_TAG_CONTENT] objectForKey:CONFIG_TAG_SRC];
    //1.4 http://
    if ([indexStr hasPrefix:F_HTTP_PATH]) {
        tmpWgt.indexUrl =indexStr;
    }else{
        if ([indexStr isEqualToString:@"#"]) {
            indexStr = @"index.html";
        }
        tmpWgt.indexUrl = [NSString stringWithFormat:@"%@/%@",wgtPath,indexStr];
    }
    
    
    //indexIcon 9,10
    NSString *iconStr = [[tmpDict objectForKey:CONFIG_TAG_ICON] objectForKey:CONFIG_TAG_SRC];
    tmpWgt.iconPath = [NSString stringWithFormat:@"%@/%@",wgtPath,iconStr];
    //加密 12
    NSString *obfuscationStr = [tmpDict objectForKey:CONFIG_TAG_OBFUSCATION];
    if([obfuscationStr isEqualToString:@"true"]){
        tmpWgt.obfuscation = F_WWIDGET_OBFUSCATION; //加密
    }else {
        tmpWgt.obfuscation = F_WWIDGET_NO_OBFUSCATION;
    }
    
    //wgtType 13
    NSString *wgtTypeStr = [tmpDict objectForKey:CONFIG_TAG_WIDGETTYPE];
    if (wgtTypeStr) {
        tmpWgt.wgtType = [wgtTypeStr intValue];
    }
    //logIP 14
    NSString *logServerIpStr = [tmpDict objectForKey:CONFIG_TAG_LOGSERVERIP];
    if (logServerIpStr) {
        tmpWgt.logServerIp = logServerIpStr;
    }
    //updateUrl 15
    NSString *updateUrlStr = [tmpDict objectForKey:CONFIG_TAG_UPDATEURL];
    if (updateUrlStr) {
        tmpWgt.updateUrl = updateUrlStr;
    }
    //16 showMySpace
    NSString *showMySpaceStr = [tmpDict objectForKey:CONFIG_TAG_SHOWMYSPACE];
    if (showMySpaceStr && [showMySpaceStr isEqualToString:@"true"]) {
        tmpWgt.showMySpace = F_WIDGET_SHOWMYSPACE;
    }
    //17.description
    NSString *desStr = [tmpDict objectForKey:CONFIG_TAG_DESCRIPTION];
    if (desStr) {
        tmpWgt.description = desStr;
    }
    //author 18,19
    NSString *authorStr = [[tmpDict objectForKey:CONFIG_TAG_AUTHOR] objectForKey:CONFIG_TAG_NAME];
    NSString *emailStr = [[tmpDict objectForKey:CONFIG_TAG_AUTHOR] objectForKey:CONFIG_TAG_EMAIL];
    if (authorStr) {
        tmpWgt.author = authorStr;
    }
    if (emailStr) {
        tmpWgt.email = emailStr;
    }
    //license 20
    NSString *licenseStr = [[tmpDict objectForKey:CONFIG_TAG_LICENSE] objectForKey:CONFIG_TAG_HREF];
    if (licenseStr) {
        tmpWgt.license = licenseStr;
    }
    //orientation 21
    NSString *orientationStr = [tmpDict objectForKey:CONFIG_TAG_ORIENTATION];
    if (orientationStr) {
        tmpWgt.orientation = [orientationStr intValue];
    }else {
        tmpWgt.orientation = 1;
    }
    //preload 22
    NSString *preloadFlag = [tmpDict objectForKey:CONFIG_TAG_PRELOAD];
    if (preloadFlag && [preloadFlag isEqualToString:@"true"]) {
        tmpWgt.preload = 1;
    }else {
        tmpWgt.preload = 0;
    }
    //isDebug
    NSString * isDebug = [tmpDict objectForKey:CONFIG_TAG_DEBUG];
    if (isDebug) {
        tmpWgt.isDebug = [isDebug boolValue];
    } else{
        tmpWgt.isDebug = NO;
    }
    
    [tmpDict removeAllObjects];
    return tmpWgt;
}

+ (NSString *)getModel {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

+ (NSString *)getOSVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)getScreenSize {
    CGRect rect_screen = [[UIScreen mainScreen] bounds];
    CGFloat rect_scale = [UIScreen mainScreen].scale;
    CGFloat width = rect_scale*rect_screen.size.width;
    CGFloat height = rect_scale*rect_screen.size.height;
    return [NSString stringWithFormat:@"%.0fx%.0f",width,height];
}

+ (NSString *)getCarrier {
    
    if ([[self getOSVersion] floatValue] < 4.0) {
        return @"unknown";
    }
    
    CTTelephonyNetworkInfo * info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier * carrier = info.subscriberCellularProvider;
    
    NSString * carrierName = carrier.carrierName;
    if (!carrierName) {
        return nil;
    }
    return carrierName;
}

+ (NSString *)getConnectStatus {
    
    if (![EUtility isNetConnected]) {
        return @"-1";
    }
    //创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    NSInteger status = [UexEMMUtility networkStatusForFlags:flags];
    switch (status) {
        case EMMNotReachable:
            return @"NO";
            break;
        case EMMReachableViaWiFi:
            return @"wifi";
            break;
        case EMMReachableVia3G:
            return @"3G";
            break;
        case EMMReachableVia2G:
            return @"2G";
            break;
        case EMMReachableVia4G:
            return @"4G";
            break;
        default:
            break;
    }
    return @"";
    
}

+ (NSInteger)networkStatusForFlags:(SCNetworkReachabilityFlags)flags {
    
    if ((flags & kSCNetworkReachabilityFlagsReachable) == 0)
    {
        return EMMNotReachable;
    }
    NSInteger retVal = EMMNotReachable;
    if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
    {
        retVal = EMMReachableViaWiFi;
    }
    if (
        ((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) ||
        (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0
        )
    {
        if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0)
        {
            retVal = EMMReachableViaWiFi;
        }
    }
    if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN)
    {
        retVal = EMMReachableVia3G;
        if((flags & kSCNetworkReachabilityFlagsReachable) == kSCNetworkReachabilityFlagsReachable)
        {
            if ((flags & kSCNetworkReachabilityFlagsTransientConnection) == kSCNetworkReachabilityFlagsTransientConnection)
            {
                retVal = EMMReachableVia3G;
                if((flags & kSCNetworkReachabilityFlagsConnectionRequired) == kSCNetworkReachabilityFlagsConnectionRequired)
                {
                    retVal = EMMReachableVia2G;
                }
            }
        }
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
            CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
            NSString *currentRadioAccessTechnology = info.currentRadioAccessTechnology;
            if (currentRadioAccessTechnology) {
                if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyLTE]) {
                    retVal =  EMMReachableVia4G;
                }
            }}}
    return retVal;
}

+ (NSString *)nowTime {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:date];
    NSString *nowTime = [NSString stringWithFormat:@"%.4d-%.2d-%.2d %.2d:%.2d:%.2d",[comps year],[comps month],[comps day],[comps hour],[comps minute],[comps second]];
    return nowTime;
}

+ (NSString *)md5CodeWithAppId:(NSString *)appId appKey:(NSString *)appKey {
    NSString *md5StrIn = [NSString stringWithFormat:@"%@:%@",appId,appKey];
    NSLog(@"hui-->uexEMM-->AppCanAnalysis-->md5Code-->md5StrIn is %@",md5StrIn);
    NSData *md5Data = [md5StrIn dataUsingEncoding:NSUTF8StringEncoding];
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    
    CC_MD5_Update(&md5, [md5Data bytes], (int)[md5Data length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    
    NSString *md5Str = [NSString stringWithFormat:
                        @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                        digest[0], digest[1], digest[2], digest[3],
                        digest[4], digest[5], digest[6], digest[7],
                        digest[8], digest[9], digest[10], digest[11],
                        digest[12], digest[13], digest[14], digest[15]];
    return [md5Str lowercaseString];
}






#pragma mark - md5


+ (NSString *)macAddress
{
    return [OpenUDID value];
}

+ (NSString *)getUUID{

    NSString *str = [UexEMMUtility macAddress];
    return str;
}

+ (NSString *)getUexEMMCBJsonStringWithTag:(int)tag {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:5];
    
    switch (tag) {
            
        case 0:
            [dict setObject:KUEX_STATUSVALUET forKey:KUEX_STATUSKEY];
            [dict setObject:KUEX_INFOVALUET forKey:KUEX_INFOKEY];
            
            break;
            
        case 1:
            [dict setObject:KUEX_STATUSVALUEF forKey:KUEX_STATUSKEY];
            [dict setObject:KUEX_INFOVALUEF forKey:KUEX_INFOKEY];
            
            break;
            
        case 2:
            [dict setObject:KUEX_ERROR_DESCRIBE_ARGS forKey:KUEX_INFOKEY];
            [dict setObject:KUEX_STATUSVALUEF forKey:KUEX_STATUSKEY];
            
            break;
            
        case 3:
            [dict setObject:kUEX_ERROR_DESCRIBE_FILE_EXIST forKey:KUEX_INFOKEY];
            [dict setObject:KUEX_STATUSVALUEF forKey:KUEX_STATUSKEY];
            
            break;
            
        default:
            
            break;
    }
    
    NSString *jsonString = [dict JSONFragment];
    
    return jsonString;
    
}

@end
