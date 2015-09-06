//
//  UexEMMAnalysis.m
//  EUExEMM
//
//  Created by liguofu on 15/9/2.
//  Copyright (c) 2015年 liguofu. All rights reserved.
//

#import "UexEMMAnalysis.h"
#import "EUExEMM.h"

@implementation UexEMMAnalysis


static UexEMMAnalysis *acInstance = nil;

#pragma mark - ACInstance

+(UexEMMAnalysis *)ACInstance{
    
    @synchronized(self) {
        
        if (acInstance == nil) {
            
            acInstance = [[self alloc] init]; // assignment not done here
        
        }
   
    }
    
    return acInstance;
    
}

- (void)initWithUexObj:(EUExEMM *)uexObj {
    
    self.uexObj = uexObj;
}

#pragma mark - md5

- (NSString *)md5SoftToken{
    
    NSData *mac = [[UexEMMUtility  macAddress] dataUsingEncoding:NSUTF8StringEncoding];
    NSData *Others = [@":" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *uuid = [[UexEMMUtility getUUID] dataUsingEncoding:NSUTF8StringEncoding];
    NSData *appkeyData = [[self getAppKey] dataUsingEncoding:NSUTF8StringEncoding];
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    
    CC_MD5_Update(&md5, [mac bytes], (int)[mac length]);
    CC_MD5_Update(&md5, [Others bytes], (int)[Others length]);
    CC_MD5_Update(&md5, [Others bytes], (int)[Others length]);
    CC_MD5_Update(&md5, [uuid bytes], (int)[uuid length]);
    CC_MD5_Update(&md5, [Others bytes], (int)[Others length]);
    CC_MD5_Update(&md5, [Others bytes], (int)[Others length]);
    CC_MD5_Update(&md5, [appkeyData bytes], (int)[appkeyData length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    
    NSString *md5Str = [NSString stringWithFormat:
                        @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                        digest[0], digest[1], digest[2], digest[3],
                        digest[4], digest[5], digest[6], digest[7],
                        digest[8], digest[9], digest[10], digest[11],
                        digest[12], digest[13], digest[14], digest[15]];
    if (!_softToken) {
        _softToken = [[NSString alloc] initWithString:[md5Str lowercaseString]];
    }
    return _softToken;
}

- (NSString*)md5Code:(NSString *)appId AppKey:(NSString *)appKey time:(NSTimeInterval)timeSince1970 {
    
    unsigned long long time = timeSince1970 * 1000;
    
    NSString *md5StrIn = [NSString stringWithFormat:@"%@:%@:%lld",appId,appKey,time];
    
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
    
    NSString *varifyApp = [NSString stringWithFormat:@"%@;%lld",[md5Str lowercaseString],time];
    
    return varifyApp;
    
}

- (NSString *)getMd5LoginName:(NSString *)loginName {
    
    NSData *loginNameData = [loginName dataUsingEncoding:NSUTF8StringEncoding];
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5, [loginNameData bytes], (int)[loginNameData length]);
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    
    NSString *md5Str = [NSString stringWithFormat:
                        @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                        digest[0], digest[1], digest[2], digest[3],
                        digest[4], digest[5], digest[6], digest[7],
                        digest[8], digest[9], digest[10], digest[11],
                        digest[12], digest[13], digest[14], digest[15]];
    
    if (!_md5LoginName) {
        
        _md5LoginName = [[NSString alloc] initWithString:[md5Str lowercaseString]];
        
    }
    
    NSFileManager *fmanager = [NSFileManager defaultManager];
    
    NSString *homeDirectory = NSHomeDirectory();
    NSString *tempPath = [homeDirectory stringByAppendingPathComponent:@"Documents/apps"];
    
    NSString *curAppId = [EUtility brwViewWidgetId:_uexObj.meBrwView];
    
    NSString *wgtTempPath = [tempPath stringByAppendingPathComponent:curAppId];
    
    if (![fmanager fileExistsAtPath:wgtTempPath]) {
        
        [fmanager createDirectoryAtPath:wgtTempPath withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    
    [self setWgtTempPathCA:wgtTempPath];
    
    //name
    NSString *certificatePathCA = [NSString stringWithFormat:@"%@/%@.p12",wgtTempPath,_md5LoginName];
    
    return certificatePathCA;

    
}

#pragma mark - get appkey appid appver appchannel

- (NSString *)getAppKey {
    
    if (KUEXEMM_IS_NSString(_appKey)) {
        
        return _appKey;
        
    } else {
        
        return nil;
        
    }
    
}

@end
