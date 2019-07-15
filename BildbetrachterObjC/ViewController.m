//
//  ViewController.m
//  BildbetrachterObjC
//
//  Created by Magnus Kruschwitz on 14.07.19.
//  Copyright © 2019 Magnus Kruschwitz. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)btnCloseClicked:(id)sender {
    [[NSApplication sharedApplication] terminate: self];
}

- (IBAction)btnOpenClicked:(id)sender {
    if([[_textFieldPath stringValue]  isEqual: @""]){
        [self modalStack:@"Leerer Inhalt" body:@"Die Pfadangaben sind leer, bitte geben Sie eine Pfadangabe ein."];
        return;
    }
    
    NSImage *tmpImage = [[NSImage alloc] initWithContentsOfFile:[_textFieldPath stringValue]];
    
    if(tmpImage != Nil){
        _imageViewDisplay.image = tmpImage;
    }
    else{
        [self modalStack:@"Fehler" body:@"Der angegebene Pfad konnte nicht geladen werden und ist daher fehlerhaft. Bitte überprüfen Sie die Datei, ob sie fehlerhaft ist."];
    }
}



- (IBAction)btnChooseClicked:(id)sender {
    NSOpenPanel *meinOeffnenDialog = [NSOpenPanel openPanel];
    NSArray* fileTypes = [NSArray arrayWithObjects:@"pdf", @"jpg", @"png", @"svg" , nil];
    
    [meinOeffnenDialog setTitle: @"Öffnen"];
    [meinOeffnenDialog setPrompt: @"Öffnen"];
    [meinOeffnenDialog setAllowedFileTypes: fileTypes];
    
    if ([meinOeffnenDialog runModal] == NSModalResponseOK) {
        NSString *meineDatei = [[meinOeffnenDialog URL] path];
        _textFieldPath.stringValue = meineDatei;
    }
    
}

- (void)modalStack:(NSString *)headline body:(NSString *)content{
    NSAlert *meineEingabe = [NSAlert new];
    [meineEingabe setMessageText:headline];
    [meineEingabe setInformativeText:content];
    [meineEingabe runModal];
}

@end
