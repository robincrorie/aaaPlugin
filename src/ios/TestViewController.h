//
//  TestViewController.h
//  aaaDemoApp
//
//  Created by Robin Crorie on 21/11/2016.
//
//

#import <UIKit/UIKit.h>

@protocol TestViewControllerDelegate <NSObject>
@required
- (void)sendPluginResult;
@end

@interface TestViewController : UIViewController {
    id <TestViewControllerDelegate> _delegate;
}

@property (nonatomic,strong) id delegate;

@end
