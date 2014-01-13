//
//  XYZViewController.h
//  ChatClient
//
//  Created by Joe Selvik on 1/12/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZViewController : UIViewController <NSStreamDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *inputNameField;
- (IBAction)joinChat:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *inputMessageField;
@property (weak, nonatomic) IBOutlet UITableView *tView;
- (IBAction)sendMessage:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *chatView;


@property (strong, nonatomic) NSInputStream *inputStream;
@property (strong, nonatomic) NSOutputStream *outputStream;

@property (strong, nonatomic) NSMutableArray * messages;

@end
