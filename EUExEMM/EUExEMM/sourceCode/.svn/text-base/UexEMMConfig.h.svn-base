//
//  UexEMMConfig.h
//  UexEMMConfig
//
//  Created by xrg on 15/8/24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#ifndef EUExDataAnalysis_UexDataAnalysisConfig_h
#define EUExDataAnalysis_UexDataAnalysisConfig_h

typedef enum {
    EMMNotReachable = -1,
    EMMReachableViaWiFi,
    EMMReachableVia3G,
    EMMReachableVia2G,//当前无法区分是联通的2G还是移动的2G
    EMMReachableVia4G
} EMMNetworkStatus;

#define SQL_WGTONE_DATABASE				@"wgtOneDB"
#define SQL_WGTS_TABLE					@"wgtTab"
//file
#define F_MAINWIDGET_NAME				@"widget"
#define F_NAME_CONFIG					@"config.xml"
#define F_UD_WgtCopyFinish       @"AppCanWgtCopyFinish"
#define F_WIDGET_SHOWMYSPACE				1

#define RequestIdentifier_Test @"test"
#define RequestIdentifier_GetLoginProperty @"getLoginProperty"
#define RequestIdentifier_StartReport @"startEveryReport"
#define RequestIdentifier_ChangePassword @"changePassword"
#define RequestIdentifier_Regist @"regist"
#define RequestIdentifier_SsoLogin @"ssoLogin"
#define RequestIdentifier_BindUserRelation @"bindUserRelation"
#define RequestIdentifier_ReleaseUserRelation @"releaseUserRelation"
#define RequestIdentifier_WidgetStartReport @"widgetStartReport"

#define KUEXEMM_IS_NSString(x) ([x isKindOfClass:[NSString class]] && x.length>0)

#define KUEXEMM_IS_NSMutableArray(x) ([x isKindOfClass:[NSMutableArray class]] && [x count]>0)
#define KUEXEMM_IS_NSArray(x) ([x isKindOfClass:[NSArray class]] && [x count]>0)

#define KUEXEMM_IS_NSMutableDictionary(x) ([x isKindOfClass:[NSMutableDictionary class]])
#define KUEXEMM_IS_NSDictionary(x) ([x isKindOfClass:[NSDictionary class]])

#define KUEX_SUCCESS 0
#define KUEX_FAILED  1
#define KUEX_ERROR_DESCRIBE_ARGS            @"参数错误"
#define kUEX_ERROR_DESCRIBE_FILE_EXIST      @"证书不存在"

#define KUEX_INFOKEY                        @"info"
#define KUEX_STATUSKEY                      @"status"

#define KUEX_STATUSVALUET                   @"ok"
#define KUEX_STATUSVALUEF                   @"fail"
#define KUEX_INFOVALUET                     @" "
#define KUEX_INFOVALUEF                     @"CA证书下载失败"

#endif
