//
//  XYZViewController.m
//  ChatClient
//
//  Created by Joe Selvik on 1/12/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "XYZViewController.h"

@interface XYZViewController ()

@end

@implementation XYZViewController {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initNetworkCommunication];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)joinChat:(id)sender {
}

- (void)initNetworkCommunication {
    // Bind two streams to a host and a port
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 80, &readStream, &writeStream);
    
    // the bridge cast does the extra bookeeping to convert a C object to an objective C object
    self.inputStream = (__bridge NSInputStream *)readStream;
    self.outputStream = (__bridge NSOutputStream *)writeStream;
    
    // set XYZViewController as the delegate for the streams
    [self.inputStream setDelegate:self];
    [self.outputStream setDelegate:self];
    
    // Schedule streams to receive events in a run loop
    [self.inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    // Open the connection!
    [self.inputStream open];
    [self.outputStream open];
}


@end
