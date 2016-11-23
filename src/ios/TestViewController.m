//
//  TestViewController.m
//  aaaDemoApp
//
//  Created by Robin Crorie on 21/11/2016.
//
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UINavigationBar * navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];

    UINavigationItem * navItem = [[UINavigationItem alloc] initWithTitle:@"Native Screen"];
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(closeViewController)];
    navItem.rightBarButtonItem = rightBtn;

    navBar.items = @[navItem];

    [self.view addSubview:navBar];
}

- (void)closeViewController {
    [self.delegate sendPluginResult];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
