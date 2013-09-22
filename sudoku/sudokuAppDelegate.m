//
//  sudokuAppDelegate.m
//  sudoku
//
//  Created by myl on 9/18/13.
//  Copyright (c) 2013 com.myl. All rights reserved.
//

#import "sudokuAppDelegate.h"
#import "string.h"
@implementation sudokuAppDelegate

int matrix[10][10];
int solve[100][10][10];
bool editable[10][10];
bool gopath[10][10];
bool ok ;
int count=0;
int nowcnt=0;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
}

- (IBAction)sovbutton:(id)sender {
    [_sovol  setEnabled:NO];
    [_nxtol setEnabled:YES];
    ok=false;
    nowcnt=0;
    count=0;
    
    memset(matrix,0,sizeof(matrix));
    memset(editable, 0, sizeof(editable));
    [self getmatrix];
            if([self pretest]==false){
            NSAlert *alert = [[NSAlert alloc] init];
            [alert addButtonWithTitle:@"OK"];
            [alert setMessageText:@"输入存在冲突"];
            [alert setInformativeText:@"行/列/九宫格内不能存在相同数字."];
            [alert setAlertStyle:NSWarningAlertStyle];
            [alert runModal];
                
    }
    else
    {
        [self dfs:0];
        if(ok)
        {
            [self copyanswer:0];
            [self showtxt];
            nowcnt++;
        }
    }
}

-(void)copyanswer:(int)ccnt
{
    int i,j;
    for(i=1;i<=9;i++)
        for(j=1;j<=9;j++)
            matrix[i][j]=solve[ccnt][i][j];

}



- (IBAction)clrbtn:(id)sender {
    [_sovol setEnabled:YES];
    [_nxtol setEnabled:NO];
    [self cleartxt];
    [_s11 setEnabled:YES];
    [_s12 setEnabled:YES];
    [_s13 setEnabled:YES];
    [_s14 setEnabled:YES];
    [_s15 setEnabled:YES];
    [_s16 setEnabled:YES];
    [_s17 setEnabled:YES];
    [_s18 setEnabled:YES];
    [_s19 setEnabled:YES];
    [_s21 setEnabled:YES];
    [_s22 setEnabled:YES];
    [_s23 setEnabled:YES];
    [_s24 setEnabled:YES];
    [_s25 setEnabled:YES];
    [_s26 setEnabled:YES];
    [_s27 setEnabled:YES];
    [_s28 setEnabled:YES];
    [_s29 setEnabled:YES];
    [_s31 setEnabled:YES];
    [_s32 setEnabled:YES];
    [_s33 setEnabled:YES];
    [_s34 setEnabled:YES];
    [_s35 setEnabled:YES];
    [_s36 setEnabled:YES];
    [_s37 setEnabled:YES];
    [_s38 setEnabled:YES];
    [_s39 setEnabled:YES];
    [_s41 setEnabled:YES];
    [_s42 setEnabled:YES];
    [_s43 setEnabled:YES];
    [_s44 setEnabled:YES];
    [_s45 setEnabled:YES];
    [_s46 setEnabled:YES];
    [_s47 setEnabled:YES];
    [_s48 setEnabled:YES];
    [_s49 setEnabled:YES];
    [_s51 setEnabled:YES];
    [_s52 setEnabled:YES];
    [_s53 setEnabled:YES];
    [_s54 setEnabled:YES];
    [_s55 setEnabled:YES];
    [_s56 setEnabled:YES];
    [_s57 setEnabled:YES];
    [_s58 setEnabled:YES];
    [_s59 setEnabled:YES];
    [_s61 setEnabled:YES];
    [_s62 setEnabled:YES];
    [_s63 setEnabled:YES];
    [_s64 setEnabled:YES];
    [_s65 setEnabled:YES];
    [_s66 setEnabled:YES];
    [_s67 setEnabled:YES];
    [_s68 setEnabled:YES];
    [_s69 setEnabled:YES];
    [_s71 setEnabled:YES];
    [_s72 setEnabled:YES];
    [_s73 setEnabled:YES];
    [_s74 setEnabled:YES];
    [_s75 setEnabled:YES];
    [_s76 setEnabled:YES];
    [_s77 setEnabled:YES];
    [_s78 setEnabled:YES];
    [_s79 setEnabled:YES];
    [_s81 setEnabled:YES];
    [_s82 setEnabled:YES];
    [_s83 setEnabled:YES];
    [_s84 setEnabled:YES];
    [_s85 setEnabled:YES];
    [_s86 setEnabled:YES];
    [_s87 setEnabled:YES];
    [_s88 setEnabled:YES];
    [_s89 setEnabled:YES];
    [_s91 setEnabled:YES];
    [_s92 setEnabled:YES];
    [_s93 setEnabled:YES];
    [_s94 setEnabled:YES];
    [_s95 setEnabled:YES];
    [_s96 setEnabled:YES];
    [_s97 setEnabled:YES];
    [_s98 setEnabled:YES];
    [_s99 setEnabled:YES];
    
   }
-(void)getmatrix{
    matrix[1][1]=[_s11 intValue];
    matrix[1][2]=[_s12 intValue];
    matrix[1][3]=[_s13 intValue];
    matrix[1][4]=[_s14 intValue];
    matrix[1][5]=[_s15 intValue];
    matrix[1][6]=[_s16 intValue];
    matrix[1][7]=[_s17 intValue];
    matrix[1][8]=[_s18 intValue];
    matrix[1][9]=[_s19 intValue];
    matrix[2][1]=[_s21 intValue];
    matrix[2][2]=[_s22 intValue];
    matrix[2][3]=[_s23 intValue];
    matrix[2][4]=[_s24 intValue];
    matrix[2][5]=[_s25 intValue];
    matrix[2][6]=[_s26 intValue];
    matrix[2][7]=[_s27 intValue];
    matrix[2][8]=[_s28 intValue];
    matrix[2][9]=[_s29 intValue];
    matrix[3][1]=[_s31 intValue];
    matrix[3][2]=[_s32 intValue];
    matrix[3][3]=[_s33 intValue];
    matrix[3][4]=[_s34 intValue];
    matrix[3][5]=[_s35 intValue];
    matrix[3][6]=[_s36 intValue];
    matrix[3][7]=[_s37 intValue];
    matrix[3][8]=[_s38 intValue];
    matrix[3][9]=[_s39 intValue];
    matrix[4][1]=[_s41 intValue];
    matrix[4][2]=[_s42 intValue];
    matrix[4][3]=[_s43 intValue];
    matrix[4][4]=[_s44 intValue];
    matrix[4][5]=[_s45 intValue];
    matrix[4][6]=[_s46 intValue];
    matrix[4][7]=[_s47 intValue];
    matrix[4][8]=[_s48 intValue];
    matrix[4][9]=[_s49 intValue];
    matrix[5][1]=[_s51 intValue];
    matrix[5][2]=[_s52 intValue];
    matrix[5][3]=[_s53 intValue];
    matrix[5][4]=[_s54 intValue];
    matrix[5][5]=[_s55 intValue];
    matrix[5][6]=[_s56 intValue];
    matrix[5][7]=[_s57 intValue];
    matrix[5][8]=[_s58 intValue];
    matrix[5][9]=[_s59 intValue];
    matrix[6][1]=[_s61 intValue];
    matrix[6][2]=[_s62 intValue];
    matrix[6][3]=[_s63 intValue];
    matrix[6][4]=[_s64 intValue];
    matrix[6][5]=[_s65 intValue];
    matrix[6][6]=[_s66 intValue];
    matrix[6][7]=[_s67 intValue];
    matrix[6][8]=[_s68 intValue];
    matrix[6][9]=[_s69 intValue];
    matrix[7][1]=[_s71 intValue];
    matrix[7][2]=[_s72 intValue];
    matrix[7][3]=[_s73 intValue];
    matrix[7][4]=[_s74 intValue];
    matrix[7][5]=[_s75 intValue];
    matrix[7][6]=[_s76 intValue];
    matrix[7][7]=[_s77 intValue];
    matrix[7][8]=[_s78 intValue];
    matrix[7][9]=[_s79 intValue];
    matrix[8][1]=[_s81 intValue];
    matrix[8][2]=[_s82 intValue];
    matrix[8][3]=[_s83 intValue];
    matrix[8][4]=[_s84 intValue];
    matrix[8][5]=[_s85 intValue];
    matrix[8][6]=[_s86 intValue];
    matrix[8][7]=[_s87 intValue];
    matrix[8][8]=[_s88 intValue];
    matrix[8][9]=[_s89 intValue];
    matrix[9][1]=[_s91 intValue];
    matrix[9][2]=[_s92 intValue];
    matrix[9][3]=[_s93 intValue];
    matrix[9][4]=[_s94 intValue];
    matrix[9][5]=[_s95 intValue];
    matrix[9][6]=[_s96 intValue];
    matrix[9][7]=[_s97 intValue];
    matrix[9][8]=[_s98 intValue];
    matrix[9][9]=[_s99 intValue];

}



-(void)showtxt{
    
    [_s11 setIntValue:matrix[1][1]];
    [_s12 setIntValue:matrix[1][2]];
    [_s13 setIntValue:matrix[1][3]];
    [_s14 setIntValue:matrix[1][4]];
    [_s15 setIntValue:matrix[1][5]];
    [_s16 setIntValue:matrix[1][6]];
    [_s17 setIntValue:matrix[1][7]];
    [_s18 setIntValue:matrix[1][8]];
    [_s19 setIntValue:matrix[1][9]];
    [_s21 setIntValue:matrix[2][1]];
    [_s22 setIntValue:matrix[2][2]];
    [_s23 setIntValue:matrix[2][3]];
    [_s24 setIntValue:matrix[2][4]];
    [_s25 setIntValue:matrix[2][5]];
    [_s26 setIntValue:matrix[2][6]];
    [_s27 setIntValue:matrix[2][7]];
    [_s28 setIntValue:matrix[2][8]];
    [_s29 setIntValue:matrix[2][9]];
    [_s31 setIntValue:matrix[3][1]];
    [_s32 setIntValue:matrix[3][2]];
    [_s33 setIntValue:matrix[3][3]];
    [_s34 setIntValue:matrix[3][4]];
    [_s35 setIntValue:matrix[3][5]];
    [_s36 setIntValue:matrix[3][6]];
    [_s37 setIntValue:matrix[3][7]];
    [_s38 setIntValue:matrix[3][8]];
    [_s39 setIntValue:matrix[3][9]];
    [_s41 setIntValue:matrix[4][1]];
    [_s42 setIntValue:matrix[4][2]];
    [_s43 setIntValue:matrix[4][3]];
    [_s44 setIntValue:matrix[4][4]];
    [_s45 setIntValue:matrix[4][5]];
    [_s46 setIntValue:matrix[4][6]];
    [_s47 setIntValue:matrix[4][7]];
    [_s48 setIntValue:matrix[4][8]];
    [_s49 setIntValue:matrix[4][9]];
    [_s51 setIntValue:matrix[5][1]];
    [_s52 setIntValue:matrix[5][2]];
    [_s53 setIntValue:matrix[5][3]];
    [_s54 setIntValue:matrix[5][4]];
    [_s55 setIntValue:matrix[5][5]];
    [_s56 setIntValue:matrix[5][6]];
    [_s57 setIntValue:matrix[5][7]];
    [_s58 setIntValue:matrix[5][8]];
    [_s59 setIntValue:matrix[5][9]];
    [_s61 setIntValue:matrix[6][1]];
    [_s62 setIntValue:matrix[6][2]];
    [_s63 setIntValue:matrix[6][3]];
    [_s64 setIntValue:matrix[6][4]];
    [_s65 setIntValue:matrix[6][5]];
    [_s66 setIntValue:matrix[6][6]];
    [_s67 setIntValue:matrix[6][7]];
    [_s68 setIntValue:matrix[6][8]];
    [_s69 setIntValue:matrix[6][9]];
    [_s71 setIntValue:matrix[7][1]];
    [_s72 setIntValue:matrix[7][2]];
    [_s73 setIntValue:matrix[7][3]];
    [_s74 setIntValue:matrix[7][4]];
    [_s75 setIntValue:matrix[7][5]];
    [_s76 setIntValue:matrix[7][6]];
    [_s77 setIntValue:matrix[7][7]];
    [_s78 setIntValue:matrix[7][8]];
    [_s79 setIntValue:matrix[7][9]];
    [_s81 setIntValue:matrix[8][1]];
    [_s82 setIntValue:matrix[8][2]];
    [_s83 setIntValue:matrix[8][3]];
    [_s84 setIntValue:matrix[8][4]];
    [_s85 setIntValue:matrix[8][5]];
    [_s86 setIntValue:matrix[8][6]];
    [_s87 setIntValue:matrix[8][7]];
    [_s88 setIntValue:matrix[8][8]];
    [_s89 setIntValue:matrix[8][9]];
    [_s91 setIntValue:matrix[9][1]];
    [_s92 setIntValue:matrix[9][2]];
    [_s93 setIntValue:matrix[9][3]];
    [_s94 setIntValue:matrix[9][4]];
    [_s95 setIntValue:matrix[9][5]];
    [_s96 setIntValue:matrix[9][6]];
    [_s97 setIntValue:matrix[9][7]];
    [_s98 setIntValue:matrix[9][8]];
    [_s99 setIntValue:matrix[9][9]];
    

}

-(void)cleartxt{
    [_s11 setStringValue:@""];
    [_s12 setStringValue:@""];
    [_s13 setStringValue:@""];
    [_s14 setStringValue:@""];
    [_s15 setStringValue:@""];
    [_s16 setStringValue:@""];
    [_s17 setStringValue:@""];
    [_s18 setStringValue:@""];
    [_s19 setStringValue:@""];
    [_s21 setStringValue:@""];
    [_s22 setStringValue:@""];
    [_s23 setStringValue:@""];
    [_s24 setStringValue:@""];
    [_s25 setStringValue:@""];
    [_s26 setStringValue:@""];
    [_s27 setStringValue:@""];
    [_s28 setStringValue:@""];
    [_s29 setStringValue:@""];
    [_s31 setStringValue:@""];
    [_s32 setStringValue:@""];
    [_s33 setStringValue:@""];
    [_s34 setStringValue:@""];
    [_s35 setStringValue:@""];
    [_s36 setStringValue:@""];
    [_s37 setStringValue:@""];
    [_s38 setStringValue:@""];
    [_s39 setStringValue:@""];
    [_s41 setStringValue:@""];
    [_s42 setStringValue:@""];
    [_s43 setStringValue:@""];
    [_s44 setStringValue:@""];
    [_s45 setStringValue:@""];
    [_s46 setStringValue:@""];
    [_s47 setStringValue:@""];
    [_s48 setStringValue:@""];
    [_s49 setStringValue:@""];
    [_s51 setStringValue:@""];
    [_s52 setStringValue:@""];
    [_s53 setStringValue:@""];
    [_s54 setStringValue:@""];
    [_s55 setStringValue:@""];
    [_s56 setStringValue:@""];
    [_s57 setStringValue:@""];
    [_s58 setStringValue:@""];
    [_s59 setStringValue:@""];
    [_s61 setStringValue:@""];
    [_s62 setStringValue:@""];
    [_s63 setStringValue:@""];
    [_s64 setStringValue:@""];
    [_s65 setStringValue:@""];
    [_s66 setStringValue:@""];
    [_s67 setStringValue:@""];
    [_s68 setStringValue:@""];
    [_s69 setStringValue:@""];
    [_s71 setStringValue:@""];
    [_s72 setStringValue:@""];
    [_s73 setStringValue:@""];
    [_s74 setStringValue:@""];
    [_s75 setStringValue:@""];
    [_s76 setStringValue:@""];
    [_s77 setStringValue:@""];
    [_s78 setStringValue:@""];
    [_s79 setStringValue:@""];
    [_s81 setStringValue:@""];
    [_s82 setStringValue:@""];
    [_s83 setStringValue:@""];
    [_s84 setStringValue:@""];
    [_s85 setStringValue:@""];
    [_s86 setStringValue:@""];
    [_s87 setStringValue:@""];
    [_s88 setStringValue:@""];
    [_s89 setStringValue:@""];
    [_s91 setStringValue:@""];
    [_s92 setStringValue:@""];
    [_s93 setStringValue:@""];
    [_s94 setStringValue:@""];
    [_s95 setStringValue:@""];
    [_s96 setStringValue:@""];
    [_s97 setStringValue:@""];
    [_s98 setStringValue:@""];
    [_s99 setStringValue:@""];

}

- (IBAction)nxtbtn:(id)sender {
    
    if(nowcnt==100)
    {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"提示"];
        [alert setInformativeText:@"最多存储100个解."];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert runModal];
        return;
    }
    
    
    else if(nowcnt==count)
    {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"提示"];
        [alert setInformativeText:@"这已经是最后一个解了."];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert runModal];

        return;
    }
    [self copyanswer:nowcnt];
    [self showtxt];
    nowcnt++;
}

-(bool)pretest
{
    int i,j,k,l;
    for(i=1;i<10;i++)
        for(j=1;j<10;j++){
            editable[i][j]=true;
            if(matrix[i][j]!=0)
            {
                editable[i][j]=false;
                if(i==1 && j==1)
                    [_s11 setEnabled:NO];
                else if(i==1 && j==2)
                    [_s12 setEnabled:NO];
                else if(i==1 && j==3)
                    [_s13 setEnabled:NO];
                else if(i==1 && j==4)
                    [_s14 setEnabled:NO];
                else if(i==1 && j==5)
                    [_s15 setEnabled:NO];
                else if(i==1 && j==6)
                    [_s16 setEnabled:NO];
                else if(i==1 && j==7)
                    [_s17 setEnabled:NO];
                else if(i==1 && j==8)
                    [_s18 setEnabled:NO];
                else if(i==1 && j==9)
                    [_s19 setEnabled:NO];
                else if(i==2 && j==1)
                    [_s21 setEnabled:NO];
                else if(i==2 && j==2)
                    [_s22 setEnabled:NO];
                else if(i==2 && j==3)
                    [_s23 setEnabled:NO];
                else if(i==2 && j==4)
                    [_s24 setEnabled:NO];
                else if(i==2 && j==5)
                    [_s25 setEnabled:NO];
                else if(i==2 && j==6)
                    [_s26 setEnabled:NO];
                else if(i==2 && j==7)
                    [_s27 setEnabled:NO];
                else if(i==2 && j==8)
                    [_s28 setEnabled:NO];
                else if(i==2 && j==9)
                    [_s29 setEnabled:NO];
                else if(i==3 && j==1)
                    [_s31 setEnabled:NO];
                else if(i==3 && j==2)
                    [_s32 setEnabled:NO];
                else if(i==3 && j==3)
                    [_s33 setEnabled:NO];
                else if(i==3 && j==4)
                    [_s34 setEnabled:NO];
                else if(i==3 && j==5)
                    [_s35 setEnabled:NO];
                else if(i==3 && j==6)
                    [_s36 setEnabled:NO];
                else if(i==3 && j==7)
                    [_s37 setEnabled:NO];
                else if(i==3 && j==8)
                    [_s38 setEnabled:NO];
                else if(i==1 && j==9)
                    [_s39 setEnabled:NO];
                else if(i==4 && j==1)
                    [_s41 setEnabled:NO];
                else if(i==4 && j==2)
                    [_s42 setEnabled:NO];
                else if(i==4 && j==3)
                    [_s43 setEnabled:NO];
                else if(i==4 && j==4)
                    [_s44 setEnabled:NO];
                else if(i==4 && j==5)
                    [_s45 setEnabled:NO];
                else if(i==4 && j==6)
                    [_s46 setEnabled:NO];
                else if(i==4 && j==7)
                    [_s47 setEnabled:NO];
                else if(i==4 && j==8)
                    [_s48 setEnabled:NO];
                else if(i==4 && j==9)
                    [_s49 setEnabled:NO];
                else if(i==5 && j==1)
                    [_s51 setEnabled:NO];
                else if(i==5 && j==2)
                    [_s52 setEnabled:NO];
                else if(i==5 && j==3)
                    [_s53 setEnabled:NO];
                else if(i==5 && j==4)
                    [_s54 setEnabled:NO];
                else if(i==5 && j==5)
                    [_s55 setEnabled:NO];
                else if(i==5 && j==6)
                    [_s56 setEnabled:NO];
                else if(i==5 && j==7)
                    [_s57 setEnabled:NO];
                else if(i==5 && j==8)
                    [_s58 setEnabled:NO];
                else if(i==6 && j==9)
                    [_s59 setEnabled:NO];
                else if(i==6 && j==1)
                    [_s61 setEnabled:NO];
                else if(i==6 && j==2)
                    [_s62 setEnabled:NO];
                else if(i==6 && j==3)
                    [_s63 setEnabled:NO];
                else if(i==6 && j==4)
                    [_s64 setEnabled:NO];
                else if(i==6 && j==5)
                    [_s65 setEnabled:NO];
                else if(i==6 && j==6)
                    [_s66 setEnabled:NO];
                else if(i==6 && j==7)
                    [_s67 setEnabled:NO];
                else if(i==6 && j==8)
                    [_s68 setEnabled:NO];
                else if(i==6 && j==9)
                    [_s69 setEnabled:NO];
                else if(i==7 && j==1)
                    [_s71 setEnabled:NO];
                else if(i==7 && j==2)
                    [_s72 setEnabled:NO];
                else if(i==7 && j==3)
                    [_s73 setEnabled:NO];
                else if(i==7 && j==4)
                    [_s74 setEnabled:NO];
                else if(i==7 && j==5)
                    [_s75 setEnabled:NO];
                else if(i==7 && j==6)
                    [_s76 setEnabled:NO];
                else if(i==7 && j==7)
                    [_s77 setEnabled:NO];
                else if(i==7 && j==8)
                    [_s78 setEnabled:NO];
                else if(i==7 && j==9)
                    [_s79 setEnabled:NO];
                else if(i==1 && j==1)
                    [_s81 setEnabled:NO];
                else if(i==8 && j==2)
                    [_s82 setEnabled:NO];
                else if(i==8 && j==3)
                    [_s83 setEnabled:NO];
                else if(i==8 && j==4)
                    [_s84 setEnabled:NO];
                else if(i==8 && j==5)
                    [_s85 setEnabled:NO];
                else if(i==8 && j==6)
                    [_s86 setEnabled:NO];
                else if(i==8 && j==7)
                    [_s87 setEnabled:NO];
                else if(i==8 && j==8)
                    [_s88 setEnabled:NO];
                else if(i==8 && j==9)
                    [_s89 setEnabled:NO];
                else if(i==9 && j==1)
                    [_s91 setEnabled:NO];
                else if(i==9 && j==2)
                    [_s92 setEnabled:NO];
                else if(i==9 && j==3)
                    [_s93 setEnabled:NO];
                else if(i==9 && j==4)
                    [_s94 setEnabled:NO];
                else if(i==9 && j==5)
                    [_s95 setEnabled:NO];
                else if(i==9 && j==6)
                    [_s96 setEnabled:NO];
                else if(i==9 && j==7)
                    [_s97 setEnabled:NO];
                else if(i==9 && j==8)
                    [_s98 setEnabled:NO];
                else if(i==9 && j==9)
                    [_s99 setEnabled:NO];
                
                
                for(k=1;k<10;k++)
                {
                    if(k==j)continue;
                    if(matrix[i][k]==matrix[i][j])return false;
                }
                for(k=1;k<10;k++)
                {
                    if(k==i)continue;
                    if(matrix[k][j]==matrix[i][j])return false;
                }
                for(k=3*((i-1)/3)+1;k<=3*((i-1)/3)+3;k++)
                    for(l=3*((j-1)/3)+1;l<=3*((j-1)/3)+3;l++)
                    {
                        if(k==i && l==j)continue;
                        if(matrix[k][l]==matrix[i][j])return false;
                    }
            }
        }
    return true;
}

-(bool)detect:(int)i:(int)j
{
    int k,l;
    
        for(k=1;k<10;k++)
        {
            if(k==j)continue;
            if(matrix[i][k]==matrix[i][j])return false;
        }
        for(k=1;k<10;k++)
        {
            if(k==i)continue;
            if(matrix[k][j]==matrix[i][j])return false;
        }
        for(k=3*((i-1)/3)+1;k<=3*((i-1)/3)+3;k++)
            for(l=3*((j-1)/3)+1;l<=3*((j-1)/3)+3;l++)
            {
                if(k==i && l==j)continue;
                if(matrix[k][l]==matrix[i][j])return false;
            }
    
    return true;
}



-(void) dfs:(int) layer
{
    if(layer == 81){
        if(count==100)return;
        ok=true;
        int i,j;
        for(i=1;i<=9;i++)
            for(j=1;j<=9;j++)
            {
                solve[count][i][j]=matrix[i][j];
            }
        count++;
        return;
    }
    if(count==100)return;
    int i=layer/9+1,j=layer%9+1;
    
    if(editable[i][j]==false)
    {
        [self dfs:layer+1];
        
    }
    
    else
    {
        int num;
        for(num=1;num<=9;num++)
        {
            matrix[i][j]=num;
            if([self detect:i:j])
            {
                [self dfs:layer+1];
                
            }
        }
    
        matrix[i][j]=0;
    }
}






@end
