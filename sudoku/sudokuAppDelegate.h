//
//  sudokuAppDelegate.h
//  sudoku
//
//  Created by myl on 9/18/13.
//  Copyright (c) 2013 com.myl. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface sudokuAppDelegate : NSObject <NSApplicationDelegate>
{
    NSTextField *_s11;
    NSTextField *_s12;
    NSTextField *_s13;
    NSTextField *_s21;
    NSTextField *_s22;
    NSTextField *_s23;
    NSTextField *_s31;
    NSTextField *_s32;
    NSTextField *_s33;
    NSTextField *_s14;
    NSTextField *_s15;
    NSTextField *_s16;
    NSTextField *_s24;
    NSTextField *_s25;
    NSTextField *_s26;
    NSTextField *_s34;
    NSTextField *_s35;
    NSTextField *_s36;
    NSTextField *_s17;
    NSTextField *_s18;
    NSTextField *_s19;
    NSTextField *_s27;
    NSTextField *_s28;
    NSTextField *_s29;
    NSTextField *_s37;
    NSTextField *_s38;
    NSTextField *_s39;
    NSTextField *_s41;
    NSTextField *_s42;
    NSTextField *_s43;
    NSTextField *_s51;
    NSTextField *_s52;
    NSTextField *_s53;
    NSTextField *_s61;
    NSTextField *_s62;
    NSTextField *_s63;
    NSTextField *_s44;
    NSTextField *_s45;
    NSTextField *_s46;
    NSTextField *_s54;
    NSTextField *_s55;
    NSTextField *_s56;
    NSTextField *_s64;
    NSTextField *_s65;
    NSTextField *_s66;
    NSTextField *_s47;
    NSTextField *_s48;
    NSTextField *_s49;
    NSTextField *_s57;
    NSTextField *_s58;
    NSTextField *_s59;
    NSTextField *_s67;
    NSTextField *_s68;
    NSTextField *_s69;
    NSTextField *_s71;
    NSTextField *_s72;
    NSTextField *_s73;
    NSTextField *_s81;
    NSTextField *_s82;
    NSTextField *_s83;
    NSTextField *_s91;
    NSTextField *_s92;
    NSTextField *_s93;
    NSTextField *_s74;
    NSTextField *_s75;
    NSTextField *_s76;
    NSTextField *_s84;
    NSTextField *_s85;
    NSTextField *_s86;
    NSTextField *_s94;
    NSTextField *_s95;
    NSTextField *_s96;
    NSTextField *_s77;
    NSTextField *_s78;
    NSTextField *_s79;
    NSTextField *_s87;
    NSTextField *_s88;
    NSTextField *_s89;
    NSTextField *_s97;
    NSTextField *_s98;
    NSTextField *_s99;
    __weak NSButton *_sovol;
    __weak NSButton *_nxtol;
    __weak NSButton *_clrol;

    
}

@property (assign) IBOutlet NSWindow *window;


@property (strong) IBOutlet NSTextField *s11;
@property (strong) IBOutlet NSTextField *s12;
@property (strong) IBOutlet NSTextField *s13;
@property (strong) IBOutlet NSTextField *s21;
@property (strong) IBOutlet NSTextField *s22;
@property (strong) IBOutlet NSTextField *s23;
@property (strong) IBOutlet NSTextField *s31;
@property (strong) IBOutlet NSTextField *s32;
@property (strong) IBOutlet NSTextField *s33;
@property (strong) IBOutlet NSTextField *s14;
@property (strong) IBOutlet NSTextField *s15;
@property (strong) IBOutlet NSTextField *s16;
@property (strong) IBOutlet NSTextField *s24;
@property (strong) IBOutlet NSTextField *s25;
@property (strong) IBOutlet NSTextField *s26;
@property (strong) IBOutlet NSTextField *s34;
@property (strong) IBOutlet NSTextField *s35;
@property (strong) IBOutlet NSTextField *s36;
@property (strong) IBOutlet NSTextField *s17;
@property (strong) IBOutlet NSTextField *s18;
@property (strong) IBOutlet NSTextField *s19;
@property (strong) IBOutlet NSTextField *s27;
@property (strong) IBOutlet NSTextField *s28;
@property (strong) IBOutlet NSTextField *s29;
@property (strong) IBOutlet NSTextField *s37;
@property (strong) IBOutlet NSTextField *s38;
@property (strong) IBOutlet NSTextField *s39;
@property (strong) IBOutlet NSTextField *s41;
@property (strong) IBOutlet NSTextField *s42;
@property (strong) IBOutlet NSTextField *s43;
@property (strong) IBOutlet NSTextField *s51;
@property (strong) IBOutlet NSTextField *s52;
@property (strong) IBOutlet NSTextField *s53;
@property (strong) IBOutlet NSTextField *s61;
@property (strong) IBOutlet NSTextField *s62;
@property (strong) IBOutlet NSTextField *s63;
@property (strong) IBOutlet NSTextField *s44;
@property (strong) IBOutlet NSTextField *s45;
@property (strong) IBOutlet NSTextField *s46;
@property (strong) IBOutlet NSTextField *s54;
@property (strong) IBOutlet NSTextField *s55;
@property (strong) IBOutlet NSTextField *s56;
@property (strong) IBOutlet NSTextField *s64;
@property (strong) IBOutlet NSTextField *s65;
@property (strong) IBOutlet NSTextField *s66;
@property (strong) IBOutlet NSTextField *s47;
@property (strong) IBOutlet NSTextField *s48;
@property (strong) IBOutlet NSTextField *s49;
@property (strong) IBOutlet NSTextField *s57;
@property (strong) IBOutlet NSTextField *s58;
@property (strong) IBOutlet NSTextField *s59;
@property (strong) IBOutlet NSTextField *s67;
@property (strong) IBOutlet NSTextField *s68;
@property (strong) IBOutlet NSTextField *s69;
@property (strong) IBOutlet NSTextField *s71;
@property (strong) IBOutlet NSTextField *s72;
@property (strong) IBOutlet NSTextField *s73;
@property (strong) IBOutlet NSTextField *s81;
@property (strong) IBOutlet NSTextField *s82;
@property (strong) IBOutlet NSTextField *s83;
@property (strong) IBOutlet NSTextField *s91;
@property (strong) IBOutlet NSTextField *s92;
@property (strong) IBOutlet NSTextField *s93;
@property (strong) IBOutlet NSTextField *s74;
@property (strong) IBOutlet NSTextField *s75;
@property (strong) IBOutlet NSTextField *s76;
@property (strong) IBOutlet NSTextField *s84;
@property (strong) IBOutlet NSTextField *s85;
@property (strong) IBOutlet NSTextField *s86;
@property (strong) IBOutlet NSTextField *s94;
@property (strong) IBOutlet NSTextField *s95;
@property (strong) IBOutlet NSTextField *s96;
@property (strong) IBOutlet NSTextField *s77;
@property (strong) IBOutlet NSTextField *s78;
@property (strong) IBOutlet NSTextField *s79;
@property (strong) IBOutlet NSTextField *s87;
@property (strong) IBOutlet NSTextField *s88;
@property (strong) IBOutlet NSTextField *s89;
@property (strong) IBOutlet NSTextField *s97;
@property (strong) IBOutlet NSTextField *s98;
@property (strong) IBOutlet NSTextField *s99;
- (IBAction)sovbutton:(id)sender;
- (IBAction)clrbtn:(id)sender;
- (IBAction)nxtbtn:(id)sender;

@property (weak) IBOutlet NSButton *sovol;
@property (weak) IBOutlet NSButton *nxtol;
@property (weak) IBOutlet NSButton *clrol;
@end
