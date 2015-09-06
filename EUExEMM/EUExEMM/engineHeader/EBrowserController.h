//
//  WebKitCorePlamAppDelegate.h
//  WebKitCorePlam
//
//  Created by yang fan on 11-8-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class EBrowserMainFrame;
@class EBrowserWidgetContainer;
@class EBrowser;
@class WWidgetMgr;
@class WWidget;
@class BallView;
@class WWidgetUpdate;
//#import "ACAuthorView.h"
//#import "AppCanAnalysis.h"
//#import "ACAuditView.h"
//#import "ACAuthorRequest.h"
//#import "ACAuditViewController.h"
#define F_STARTIMG_WIDTH_HEIGHT  480

#define F_EBRW_CTRL_FLAG_FORBID_ROTATE		0x1
#define F_NEED_REPORT_APP_START             0x2
#define F_EBRW_CTRL_FLAG_AUTH_SUCCESSED     0x4


#define F_DEVICE_INFO_ID_ORIENTATION_PORTRAIT				1
#define F_DEVICE_INFO_ID_ORIENTATION_LANDSCAPE_LEFT			2
#define F_DEVICE_INFO_ID_ORIENTATION_PORTRAIT_UPSIDEDOWN	4
#define F_DEVICE_INFO_ID_ORIENTATION_LANDSCAPE_RIGHT		8
//4.8
#define F_ForbidPlugins    @"AppCanPluginsKey"
#define F_ForbidWindows    @"AppCanWindowsKey"
#define F_AuthType         @"AppCanAuthType"
@interface EBrowserController : UIViewController <UIAccelerometerDelegate,UIAlertViewDelegate>{
	UIImageView *mStartView;
	EBrowser *meBrw;
	EBrowserMainFrame *meBrwMainFrm;
	WWidgetMgr *mwWgtMgr;
	NSLock *mSplashLock;
	BOOL mSplashFired;
	BallView *ballView;
	int mFlag;
	BOOL ballHasShow; 
    NSMutableArray *mamList;
    //BOOL sNeedAuthor;
    UIView *mLoadingView;
    BOOL isHadShowAlertView;
    //szc 2013.10.14
    int wgtOrientation;
}
@property (nonatomic, retain) UIImageView *mStartView;
@property (nonatomic, retain) EBrowserMainFrame *meBrwMainFrm;
@property (nonatomic, retain) EBrowser *meBrw;
@property (nonatomic, retain) WWidgetMgr *mwWgtMgr;
@property (nonatomic, assign) BOOL mSplashFired;
@property (nonatomic, assign) BOOL ballHasShow;
@property (nonatomic, assign) BOOL isHadShowAlertView;
@property (nonatomic, assign) int mFlag;
@property (nonatomic, retain) UIView *mLoadingView;
@property (nonatomic,retain)NSMutableArray *forebidPluginsList;
@property (nonatomic,retain)NSMutableArray *forebidWinsList;
@property (nonatomic,retain)NSMutableArray *forebidPopWinsList;
@property(nonatomic,assign)int wgtOrientation;
- (EBrowserWidgetContainer*)brwWidgetContainer;
@end

