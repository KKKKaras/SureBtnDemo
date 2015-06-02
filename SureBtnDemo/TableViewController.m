//
//  TableViewController.m
//  SureBtnDemo
//
//  Created by invoker on 15/6/2.
//  Copyright (c) 2015年 invoker. All rights reserved.
//

#import "TableViewController.h"
#import "Democell.h"
@interface TableViewController ()
{
    UIButton *_sureBtn;
    
    UITextField *_cellText;
    UIView * _view;
    UITextField *_tempText1;
    UITextField *_tempText2;
    UITextField *_tempText3;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _sureBtn.frame = CGRectMake(self.tableView.frame.size.width-60, 5, 50, 28);
    _sureBtn.backgroundColor = [UIColor colorWithRed:0.150 green:0.662 blue:0.915 alpha:1.000];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _sureBtn.layer.cornerRadius = 5.0;
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(changeRemarks) forControlEvents:UIControlEventTouchUpInside];
    _view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    _view.backgroundColor=[UIColor whiteColor];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor blackColor];
    [_view addSubview:line];
    [_view addSubview:_sureBtn];
    UINib *nibMenu=[UINib nibWithNibName:@"Democell" bundle:nil];
    [self.tableView registerNib:nibMenu forCellReuseIdentifier:@"democell"];
    
   
}
- (void)changeRemarks
{
      [_tempText1 resignFirstResponder];
      [_tempText2 resignFirstResponder];
      [_tempText3 resignFirstResponder];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //查找一个已经移出屏幕的单元格，进行复用，以节省内存。
     Democell*cellMenu = [tableView dequeueReusableCellWithIdentifier:@"democell" forIndexPath:indexPath];
    cellMenu.selectionStyle = UITableViewCellSelectionStyleNone;
    if(indexPath.row==0)
    {
        _tempText1=cellMenu.celltext;
        _tempText1.inputAccessoryView = _view;
        
    }
    else if(indexPath.row==1)
    {
        _tempText2=cellMenu.celltext;
        _tempText2.inputAccessoryView = _view;
    }
    else
    {
        _tempText3=cellMenu.celltext;
        _tempText3.inputAccessoryView = _view;
    }
    
    return cellMenu;
}

@end
