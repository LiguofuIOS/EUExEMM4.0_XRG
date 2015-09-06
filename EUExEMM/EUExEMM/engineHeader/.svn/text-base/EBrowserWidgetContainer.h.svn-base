//
//  EBrowserWidgetContainer.h
//  WBPalm
//
//  Created by 邹 达 on 11-11-8.
//  Copyright 2011 zywx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EBrowserController;
@class EBrowserWindowContainer;
@class EBrowserView;

@interface EBrowserWidgetContainer : UIView {
	EBrowserController *meBrwCtrler;
	EBrowserWindowContainer *meRootBrwWndContainer;
	NSMutableDictionary *mBrwWndContainerDict;
	NSMutableArray *mReUseBrwViewArray;
}

@property (nonatomic, assign) EBrowserController *meBrwCtrler;
@property (nonatomic, assign) EBrowserWindowContainer *meRootBrwWndContainer;
@property (nonatomic, assign) NSMutableDictionary *mBrwWndContainerDict;
@property (nonatomic, assign) NSMutableArray *mReUseBrwViewArray;

- (id)initWithFrame:(CGRect)frame BrwCtrler:(EBrowserController*)eInBrwCtrler;
- (void)notifyLoadPageStartOfBrwView: (EBrowserView*)eInBrwView;
- (void)notifyLoadPageFinishOfBrwView: (EBrowserView*)eInBrwView;
- (void)notifyLoadPageErrorOfBrwView: (EBrowserView*)eInBrwView;
- (EBrowserWindowContainer*)aboveWindowContainer;
- (EBrowserView*)popReuseBrwView;
- (void)pushReuseBrwView:(EBrowserView*)inBrwView;
- (void)removeAllUnActiveBrwWndContainer;

@end
