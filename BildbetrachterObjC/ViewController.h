//
//  ViewController.h
//  BildbetrachterObjC
//
//  Created by Magnus Kruschwitz on 14.07.19.
//  Copyright © 2019 Magnus Kruschwitz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

//outlets
@property (weak) IBOutlet NSTextField *textFieldPath;
@property (weak) IBOutlet NSImageView *imageViewDisplay;

//actions
- (IBAction)btnCloseClicked:(id)sender;
- (IBAction)btnOpenClicked:(id)sender;
- (IBAction)btnChooseClicked:(id)sender;

//own
- (void)modalStack:(NSString*)headline body:(NSString*)content;

@end

