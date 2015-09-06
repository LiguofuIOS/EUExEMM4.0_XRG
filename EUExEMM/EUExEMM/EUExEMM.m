//
//  EUExEMM.m
//  EUExEMM
//
//  Created by liguofu on 15/8/31.
//  Copyright (c) 2015年 liguofu. All rights reserved.
//

#import "EUExEMM.h"
#import "WidgetOneDelegate.h"

#pragma mark - super

@implementation EUExEMM

- (id)initWithBrwView:(EBrowserView *)eInBrwView {
    
    if (self = [super initWithBrwView:eInBrwView]) {
        
        NSLog(@"appcan4.0==>>uexEMM==>>EUExEMM==>>initWithBrwView==>>version_3.1.0");
        
    }
    
    return self;
    
}

- (void)clean {
    
}

#pragma mark - engineEvent

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"appcan4.0==>>EUExEMM==>>didFinishLaunchingWithOptions==>>startReport");
    
    UexEMMWidgetStartReport * reportMgr = [UexEMMWidgetStartReport sharedManager];
    
    [reportMgr widgetStartReport];
    
    return YES;
}

#pragma mark - publish

/**
 *
 * 1.2	获取认证字段以及注册字段接
 *
 * URL:https://host:port/v4/user/form
 *
 **/
- (void)getLoginProperty:(NSMutableArray *)inArguments {
    
    if ([inArguments count] < 1) {
        return;
    }
    
    NSString * postJsonStr = [inArguments objectAtIndex:0];//{"appId":"sdk0001","tenantAccount":"zgdxjt",}
    
    NSString * postURL = [NSString stringWithFormat:@"%@/v4/user/form",theApp.useStartReportURL];
    
    UexEMMRequestMgr * requestMgr = [[UexEMMRequestMgr alloc]initWithUexObj:self];
    
    requestMgr.identifier = RequestIdentifier_GetLoginProperty;
    
    requestMgr.delegate = self;
    
    [requestMgr post:postURL RequestBodyParams:postJsonStr RequestHeaders:nil];
    
}

/**
 *
 * 1.3 登录认证接口
 *
 * 需要证书和不需要证书两种模式
 *
 * URL: http://host:port/v4/user/login
 *
 * CA: 192.168.1.144:8080/emm/certManage/downLoadCert?checkCode=H24ZE2H0LQ
 *
 **/
- (void)login:(NSMutableArray *)inArguments {
    
    if ([inArguments count] < 1) {
        return;
    }
    
    NSString * postJsonStr = [inArguments objectAtIndex:0];//{"appId":"sdk0001","tenantAccount ":"zgdxjt","loginName":"admin","loginPass":"test","domainName":"test","clientValidateCode":"0011","softToken":"skf00011111"}
    
    NSString * postURL = [NSString stringWithFormat:@"%@/v4/user/login",theApp.useStartReportURL];
    
    UexEMMRequestMgr * requestMgr = [[UexEMMRequestMgr alloc]initWithUexObj:self];
    
    requestMgr.identifier = RequestIdentifier_GetLoginProperty;
    
    requestMgr.delegate = self;
    
    BOOL isCertificate_ = NO;
    
    if ([inArguments count] > 1) {
        //是否需要CA证书认证
    }

    requestMgr.isCertificate = isCertificate_;
    
    [requestMgr post:postURL RequestBodyParams:postJsonStr RequestHeaders:nil];
    
}

/**
 *
 * 1.4	修改密码
 *
 * URL: http://host:port/v4/user/changePassword
 *
 **/
- (void)changePassword:(NSMutableArray *)inArguments {
    
    if ([inArguments count] < 1) {
        return;
    }
    
    NSString * postJsonStr = [inArguments objectAtIndex:0];//{"accessToken":"77102967-116f-462f-a461-a402ea411ca0","loginName ":"admin","loginPass ":"admin","loginPass1":"test"," loginPass2":"test","softToken":"skf00011111"}
    
    NSString * postURL = [NSString stringWithFormat:@"%@/v4/user/changePassword",theApp.useStartReportURL];
    
    UexEMMRequestMgr * requestMgr = [[UexEMMRequestMgr alloc]initWithUexObj:self];
    
    requestMgr.identifier = RequestIdentifier_ChangePassword;
    
    requestMgr.delegate = self;
    
    [requestMgr post:postURL RequestBodyParams:postJsonStr RequestHeaders:nil];
    
}

/**
 *
 * 1.5	注册接口（只针对支持注册的域）
 *
 * URL: http://host:port/v4/user/registe
 *
 **/
- (void)regist:(NSMutableArray *)inArguments {
    
    if ([inArguments count] < 1) {
        return;
    }
    
    NSString * postJsonStr = [inArguments objectAtIndex:0];//{"appId":"sdk0001","tenantAccount ":"zgdxjt","domainName ":"bug.3g2win.com ","loginName ":"admin","loginPass ":"admin"," userName ":"admin","userPhone ":"18600000000","userEmail ":"xxx@3g2win.com "}
    
    NSString * postURL = [NSString stringWithFormat:@"%@/v4/user/registe",theApp.useStartReportURL];
    
    UexEMMRequestMgr * requestMgr = [[UexEMMRequestMgr alloc]initWithUexObj:self];
    
    requestMgr.identifier = RequestIdentifier_Regist;
    
    requestMgr.delegate = self;
    
    [requestMgr post:postURL RequestBodyParams:postJsonStr RequestHeaders:nil];
    
}

/**
 *
 * 1.6	子应用单点登录接口
 *
 * URL: http://host:port/v4/user/ssoLogin
 *
 **/
- (void)ssoLogin:(NSMutableArray *)inArguments {
    
    if ([inArguments count] < 1) {
        return;
    }
    
    NSString * postJsonStr = [inArguments objectAtIndex:0];//{"mainAccessToken ":"27a06615-7505-4783-8afb-ad71e5551c46","domainName":"bug.3g2win.com","loginName ":"admin","loginPass":"admin","userName":"admin","authType":"AuthUserNameAndPwd "," softToken":"skf00011111",}
    
    NSString * postURL = [NSString stringWithFormat:@"%@/v4/user/ssoLogin",theApp.useStartReportURL];
    
    UexEMMRequestMgr * requestMgr = [[UexEMMRequestMgr alloc]initWithUexObj:self];
    
    requestMgr.identifier = RequestIdentifier_SsoLogin;
    
    requestMgr.delegate = self;
    
    [requestMgr post:postURL RequestBodyParams:postJsonStr RequestHeaders:nil];
    
}

/**
 *
 * 1.7	用户关系绑定接口
 *
 * URL: http://host:port/v4/user/bindUserRelation
 *
 **/
- (void)bindUserRelation:(NSMutableArray *)inArguments {
    
    if ([inArguments count] < 1) {
        return;
    }
    
    NSString * postJsonStr = [inArguments objectAtIndex:0];//{"mainAccessToken ":"27a06615-7505-4783-8afb-ad71e5551c46","domainName":"bug.3g2win.com","loginName ":"admin","loginPass":"admin","userName":"admin","authType":" AuthUserNameAndPwd","softToken":"skf00011111",}
    
    NSString * postURL = [NSString stringWithFormat:@"%@/v4/user/bindUserRelation",theApp.useStartReportURL];
    
    UexEMMRequestMgr * requestMgr = [[UexEMMRequestMgr alloc]initWithUexObj:self];
    
    requestMgr.identifier = RequestIdentifier_BindUserRelation;
    
    requestMgr.delegate = self;
    
    [requestMgr post:postURL RequestBodyParams:postJsonStr RequestHeaders:nil];
    
}

/**
 *
 * 1.8	用户关系注销接口（子应用注销）
 *
 * URL: http://host:port/v4/user/releaseUserRelation
 *
 **/
- (void)releaseUserRelation:(NSMutableArray *)inArguments {
    
    if ([inArguments count] < 1) {
        return;
    }
    
    NSString * postJsonStr = [inArguments objectAtIndex:0];//{" mainAccessToken ":"27a06615-7505-4783-8afb-ad71e5551c46","softToken":"skf00011111",}
    
    NSString * postURL = [NSString stringWithFormat:@"%@/v4/user/releaseUserRelation",theApp.useStartReportURL];
    
    UexEMMRequestMgr * requestMgr = [[UexEMMRequestMgr alloc]initWithUexObj:self];
    
    requestMgr.identifier = RequestIdentifier_BindUserRelation;
    
    requestMgr.delegate = self;
    
    [requestMgr post:postURL RequestBodyParams:postJsonStr RequestHeaders:nil];
    
}

- (void)validateCode:(NSMutableArray *)inArguments {
    
}

- (void)boundOtherInfo:(NSMutableArray *)inArguments {
    
}

- (void)validateBindCode:(NSMutableArray *)inArguments {
    
}

- (void)getVerificationImage:(NSMutableArray *)inArguments {
    
}

- (void)logout:(NSMutableArray *)inArguments {
    
}

/**
 *  手动启动上报
 **/
- (void)widgetStartReport:(NSMutableArray *)inArguments {
    
}

/**
 *  获取自定义参数
 **/
- (void)updateParams:(NSMutableArray*)inArguments {
    
}

/**
 *  获得当前应用的appid version channelCode
 **/
- (void)getWidgetInfo:(NSMutableArray *)inArguments {
    
    [self jsSuccessWithName:@"uexEMM.cbGetWidgetInfo" opId:0 dataType:UEX_CALLBACK_DATATYPE_TEXT strData:[UexEMMUtility getWidgetInfoByUexObj:self]];
    
}

/**
 *  获得当前应用启动上报信息
 **/
- (void)getWidgetReportResult:(NSMutableArray *)inArguments {
    
}

/**
 *  获取SoftToken
 **/
- (void)getSoftToken:(NSMutableArray *)inArguments {
    
    [self jsSuccessWithName:@"uexEMM.cbGetSoftToken" opId:0 dataType:UEX_CALLBACK_DATATYPE_TEXT strData:[EUtility md5SoftToken]];

}

/**
 *  获取AccessToken
 **/
- (void)getAccessToken:(NSMutableArray *)inArguments {
    
    NSString * appId = [inArguments count] > 0?[inArguments objectAtIndex:0]:self.meBrwView.mwWgt.appId;
    
    [self jsSuccessWithName:@"uexEMM.cbGetAccessToken" opId:0 dataType:UEX_CALLBACK_DATATYPE_TEXT strData:[UexEMMUtility getAccessTokenForAppId:appId]];
    
}

/**
 *  删除AccessToken
 **/
- (void)removeAcessToken:(NSMutableArray *)inArguments {
    
    NSString * appId = [inArguments count] > 0?[inArguments objectAtIndex:0]:self.meBrwView.mwWgt.appId;
    
    [UexEMMUtility removeAccessTokenForAppId:appId];
    
}


#pragma mark - temp
/**
 *
 * EMM 登录
 *
 * 需要证书和不需要证书两种模式
 *
 * URL: http://host:port/v4/user/login
 *
 * CA: 192.168.1.144:8080/emm/certManage/downLoadCert?checkCode=H24ZE2H0LQ
 **/

- (void)login_lgf:(NSMutableArray *)inArguments {
    
    
    
    
    WWidget *curWgt = self.meBrwView.mwWgt;
    
    NSString *appId = curWgt.appId;
    
   _dataDict = (NSDictionary *)[[inArguments objectAtIndex:0] JSONValue];
    
    if (!KUEXEMM_IS_NSDictionary(_dataDict)) {
        
        return;
        
    } else {
        
        //NSLog(@"appcan-->EUExEMM-->login-->参数不合法");
        
    }
    
    NSString *softToken = [[UexEMMAnalysis ACInstance] md5SoftToken];
    
    NSString *httpUrl = [NSString stringWithFormat:@"%@v4/user/login", theApp.useStartReportURL];
    
    NSLog(@"appcan-->EUExEMM-->login-->httpUrl == %@", httpUrl);
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    
    NSString *varifyAppStr = [[UexEMMAnalysis ACInstance] md5Code:appId AppKey:[BUtility appKey] time:time];
    
    NSMutableDictionary *headerDict = [NSMutableDictionary dictionaryWithObject:varifyAppStr forKey:@"varifyApp"];
    
    if (inArguments.count > 1) {
        
       _dictCA = (NSDictionary *)[[inArguments objectAtIndex:1] JSONValue];
        
        if (!_dictCA || [_dictCA count]==0) {
            
            return;
            
        }
        //是否需要CA证书认证,YES 需要;NO 不需要
        _isCertificate = NO;
        
        if ([_dictCA objectForKey:@"isCertificate"]) {
            
            _isCertificate = [[_dictCA objectForKey:@"isCertificate"] boolValue];
            
        } else {
            
            //[self jsSuccessWithName:@"uexEMM.cbLogin" opId:0 dataType:0 strData:[self getJsonString:2]];
            //return;
            
        }
        
        if (_isCertificate == YES) {
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"本次登录需要验证用户证书，请输入证书授权码，申请证书"
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"申请证书", nil];
            
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            
        }
        
    }
    
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    UITextField *tf = [alertView textFieldAtIndex:0];
    
    if (KUEXEMM_IS_NSString(tf.text)) {
        
        [self setCheckCode:tf.text];
        
    } else {
        
        [self setCheckCode:@""];
        
    }
    
    NSLog(@"appcan-->EUExEMM-->UIAlertViewDelegate-->证书授权码为:%@",_checkCode);
    
    //证书密码
    NSString *certPwd = @"";
    
    if ([_dictCA objectForKey:@"certPwd"]) {
        
        certPwd = [_dictCA objectForKey:@"certPwd"];
        
    } else {
        
        [self jsSuccessWithName:@"uexEMM.cbLogin" opId:0 dataType:0 strData:[UexEMMUtility getUexEMMCBJsonStringWithTag:2]];
        
        return;
        
    }
    
    if ([_dictCA objectForKey:@"caurl"]) {
        
        NSString *httpUrl = [NSString stringWithFormat:@"%@/%@/",[_dictCA objectForKey:@"caurl"],_checkCode];
        
    } else {
        
        [self jsSuccessWithName:@"uexEMM.cbLogin" opId:0 dataType:0 strData:[UexEMMUtility getUexEMMCBJsonStringWithTag:2]];
        
        return;
    }
    
    NSString *loginName = [_dictCA objectForKey:@"loginName"]?[_dictCA objectForKey:@"loginName"]:[_dataDict objectForKey:@"loginName"];
    
    if (KUEXEMM_IS_NSString(loginName)) {
        
        
    } else {
        //不存在
        [self jsSuccessWithName:@"uexEMM.cbLogin" opId:0 dataType:0 strData:[UexEMMUtility getUexEMMCBJsonStringWithTag:2]];
        return;
    }
    
    [[UexEMMAnalysis ACInstance] initWithUexObj:self];

    NSString *certificatePathCA = [[UexEMMAnalysis ACInstance] getMd5LoginName:loginName];
    
    NSFileManager *fmanager = [NSFileManager defaultManager];
    
    //判断证书路径是否存在
    if ([fmanager fileExistsAtPath:certificatePathCA]) {
        
        NSUserDefaults *udf = [NSUserDefaults standardUserDefaults];
        
        [udf setObject:certificatePathCA forKey:@"caSavePath"];
        [udf setObject:certPwd forKey:@"certPwd"];
        
    } else {
        
        //此loginName对应的CA证书不存在,去下载证书
        //[self queryUserCertFile:loginName];
    }
    
}

#pragma mark - UexEMMRequestMgrDelegate

- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didReceiveResponse:(NSURLResponse *)response {
    
    NSLog(@"appcan4.0==>>EUExEMM==>>didFailWithError==>>%@==>>%@",requestMgr.identifier,[response description]);
    
    if ([requestMgr.identifier isEqualToString:RequestIdentifier_GetLoginProperty]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_ChangePassword]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_StartReport]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_Regist]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_SsoLogin]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_BindUserRelation]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_ReleaseUserRelation]) {
        
        
    }
    
}


- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didFailWithError:(NSError *)error {
    
    NSLog(@"appcan4.0==>>EUExEMM==>>didFailWithError==>>%@==>>%@",requestMgr.identifier,[error description]);
    
    if ([requestMgr.identifier isEqualToString:RequestIdentifier_GetLoginProperty]) {
        
        [self jsSuccessWithName:@"uexEMM.cbGetLoginProperty" opId:0 dataType:UEX_CALLBACK_DATATYPE_JSON strData:[error description]];
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_ChangePassword]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_StartReport]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_Regist]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_SsoLogin]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_BindUserRelation]) {
        
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_ReleaseUserRelation]) {
        
        
    }
    
}

- (void)RequestMgr:(UexEMMRequestMgr *)requestMgr didFinishWithData:(NSData *)data {
    
    NSString * postData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"appcan4.0==>>EUExEMM==>>didFinishWithData==>>%@==>>%@",requestMgr.identifier,postData);
    
    if ([requestMgr.identifier isEqualToString:RequestIdentifier_GetLoginProperty]) {
        
        [self jsSuccessWithName:@"uexEMM.cbGetLoginProperty" opId:0 dataType:UEX_CALLBACK_DATATYPE_JSON strData:postData];
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_ChangePassword]) {
        
        [self jsSuccessWithName:@"uexEMM.cbChangePassword" opId:0 dataType:UEX_CALLBACK_DATATYPE_JSON strData:postData];
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_StartReport]) {
        
        [super jsSuccessWithName:@"uexEMM.cbLogin" opId:0 dataType:UEX_CALLBACK_DATATYPE_JSON strData:postData];
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_Regist]) {
        
        [self jsSuccessWithName:@"uexEMM.cbRegist" opId:0 dataType:UEX_CALLBACK_DATATYPE_JSON strData:postData];
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_SsoLogin]) {
        
        [self jsSuccessWithName:@"uexEMM.cbSsoLogin" opId:0 dataType:UEX_CALLBACK_DATATYPE_JSON strData:postData];
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_BindUserRelation]) {
        
        [self jsSuccessWithName:@"uexEMM.cbBindUserRelation" opId:0 dataType:UEX_CALLBACK_DATATYPE_JSON strData:postData];
        
    } else if ([requestMgr.identifier isEqualToString:RequestIdentifier_ReleaseUserRelation]) {
        
        [self jsSuccessWithName:@"uexEMM.cbReleaseUserRelation" opId:0 dataType:UEX_CALLBACK_DATATYPE_JSON strData:postData];
        
    }
    
}

@end
