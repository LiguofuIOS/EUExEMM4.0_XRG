//
//  PullDownRefreshHeaderView.h
//  WebKitCorePlam
//
//  Created by yang fan on 12-5-9.
//  Copyright 2012 zywx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
	PullRefreshPulling = 0,
	PullRefreshNormal,
	PullRefreshLoading,	
}  PullRefreshState;

@protocol PullDownRefreshHeaderDelegate;

@interface PullDownRefreshHeaderView : UIView {
	id _delegate;
	PullRefreshState _state;
	
	UILabel *_lastUpdatedLabel;
	UILabel *_statusLabel;
	CALayer *_arrowImage;
	UIActivityIndicatorView *_activityView;
	
}
@property(nonatomic,assign) id <PullDownRefreshHeaderDelegate> delegate;

- (void)refreshLastUpdatedDate;
- (void)refreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)refreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)refreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end
@protocol PullDownRefreshHeaderDelegate
- (void)refreshHeaderDidTriggerRefresh:(PullDownRefreshHeaderView*)view;
- (BOOL)refreshHeaderDataSourceIsLoading:(PullDownRefreshHeaderView*)view;
@optional
- (NSDate*)refreshHeaderDataSourceLastUpdated:(PullDownRefreshHeaderView*)view;

@end
