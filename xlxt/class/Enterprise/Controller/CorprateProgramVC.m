//
//  CorprateProgramVC.m
//  xlxt
//
//  Created by xlky on 2017/4/7.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CorprateProgramVC.h"
#import "CoCourseCell.h"
#import "CoCourseModel.h"
@interface CorprateProgramVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    NSDictionary *dic2;
    int pageindex;
    int btnmode;
}
@property (nonatomic,strong)UITableView *CtableView;
@property (nonatomic,strong)NSMutableArray *Carray;

@property (nonatomic,strong)UIView *BtnView;
@property (nonatomic,strong)NSArray *btnarray;

@end

@implementation CorprateProgramVC
//Lazy Load
-(UIView *)BtnView
{
    if (!_BtnView) {
        _BtnView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenH/3+30, kScreenW, self.btnarray.count%4==0?self.btnarray.count/4*30:(self.btnarray.count/4+1)*30)];
        [self.CtableView addSubview:_BtnView];
        _BtnView.hidden = YES;
        [self Btncreate];
        
    }
    return _BtnView;
}

-(UITableView *)CtableView
{
    if (!_CtableView) {
        _CtableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-10) style:UITableViewStylePlain];

        
        [self.view addSubview:_CtableView];
    }
    return _CtableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"企业试题";
     [self.CtableView registerClass:[CoCourseCell class] forCellReuseIdentifier:@"cellc"];
     [self CtableView];
     self.CtableView.delegate = self;
     self.CtableView.dataSource = self;
    [self loadwebdata];
    
    NSArray *BtnArr = @[@"全部课程",@"慢病课程",@"产品课程"];
    
    for (int i = 0; i<3; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame =CGRectMake(kScreenW/3*i, kScreenH/3, kScreenW/3, 30);
        btn.tag = i;
        [btn setTitle:BtnArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [btn addTarget:self action:@selector(catagory:) forControlEvents:UIControlEventTouchUpInside];
        [self.CtableView addSubview:btn];
        
    }
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame =CGRectMake(kScreenW/5, kScreenH/3, 15, 30);
    [btn2 setTitle:@"V" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn2 addTarget:self action:@selector(unfold:) forControlEvents:UIControlEventTouchUpInside];
    [self.CtableView addSubview:btn2];

    pageindex = 1;
    btnmode = 0;
   
}
-(void)unfold:(UIButton *)btn
{
    if (_BtnView.hidden == YES) {
        _BtnView.hidden = NO;
    }else{
        _BtnView.hidden = YES;
    }

}
-(void)catagory:(UIButton *)btn
{
    btnmode = btn.tag;
    pageindex = 1;
    if (btn.tag == 0) {
       
        [self LoadCatagoryDataWithUrl:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=0&pagesize=10&pageindex=1&IsOwn=0&category_id=0"];
    }
    /*
     else if (btn.tag == 1){
     
     [self LoadCatagoryDataWithUrl:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=0&pagesize=10&pageindex=1&IsOwn=1&category_id=0"];
     _BtnView.hidden = YES;
     
     }
     */
    
     else if (btn.tag == 1){
     [self LoadCatagoryDataWithUrl:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=565&pagesize=10&pageindex=1&IsOwn=0&category_id=0"];
     _BtnView.hidden = YES;
     }

    else{
        [self LoadCatagoryDataWithUrl:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=48&pagesize=10&pageindex=1&IsOwn=0&category_id=0"];
        _BtnView.hidden = YES;
    }
}

-(void)Btncreate
{    int i = 0;
    float w = kScreenW/4;
    float h = 30;
    for (dic2 in self.btnarray) {
        UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(i%4*w, i/4*h, w, h)];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn1 setTitle:dic2[@"Name"] forState:UIControlStateNormal];
        btn1.tag = [dic2[@"Cate_ID"] intValue];
        btn1.backgroundColor = [UIColor whiteColor];
        btn1.layer.borderWidth=1.0f;
        btn1.layer.borderColor= MainGrayColor.CGColor;
        btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn1 addTarget:self action:@selector(Btnaction:) forControlEvents:UIControlEventTouchUpInside];
        [self.BtnView addSubview:btn1];
        i++;

    }
}

-(void)Btnaction:(UIButton *)btn1
{   btnmode = btn1.tag;
    pageindex = 1;
    NSString *url123 = [NSString stringWithFormat:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=%ld&pagesize=10&pageindex=1&IsOwn=0&category_id=0",(long)btn1.tag];
    [self LoadCatagoryDataWithUrl:url123];
    
}
-(void)loadwebdata
{
    WS(weakSelf);
    self.Carray = [NSMutableArray array];
    [BaseWebUtils Get:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=0&pagesize=10&pageindex=1&IsOwn=0&category_id=0" andParams:nil andCallback:^(id obj) {
        if (obj) {
     
        NSArray *dataArr = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];
       // NSLog(@"输出请求到的数据%@",dataArr);
        for (NSDictionary *dic in dataArr) {
//            CoCourseModel *Cmd=[[CoCourseModel alloc]initWithDictionary:dic error:nil];
//            [weakSelf.Carray addObject:Cmd];
        }
       // NSLog(@"输出企业课程的数组%@",weakSelf.Carray);
        [weakSelf.CtableView reloadData];
               }
    }];
    
    [BaseWebUtils Get:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetChildCateList&cateid=538" andParams:nil andCallback:^(id obj) {
        
        self.btnarray = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];

        [self BtnView];
      //  [weakSelf.CtableView reloadData];
    }];

}

-(void)LoadCatagoryDataWithUrl:(NSString*)url
{
    WS(weakSelf);
    NSMutableArray *CataArray = [NSMutableArray array];
    [BaseWebUtils Get:url andParams:nil andCallback:^(id obj) {
        if (obj) {
            
     
        NSArray *catagory =[NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];
            
         //   NSLog(@"输出catagory:%@",catagory);
            if(![catagory isKindOfClass:[NSArray class]]){
                return ;
            }
        for (NSDictionary *dic in catagory) {
            

//            CoCourseModel *Cmd=[[CoCourseModel alloc]initWithDictionary:dic error:nil];
//            [CataArray addObject:Cmd];
        }
        weakSelf.Carray = CataArray;
        
        [self.CtableView reloadData];
           }
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Carray.count+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"Cell1";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        return cell;

    }
    CoCourseCell *Ccell = [tableView dequeueReusableCellWithIdentifier:@"cellc" forIndexPath:indexPath];
    
    Ccell.cmodel = self.Carray[indexPath.row-1];
    return Ccell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 30;
    }
    
    CoCourseModel *am = self.Carray[indexPath.row-1];
    CGSize titleSize = [@"123" boundingRectWithSize:CGSizeMake(kScreenW*2/3.5, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;

       return titleSize.height+60;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _BtnView.hidden = YES;
//    CoCourseModel*cm = self.Carray[indexPath.row-1];
//    PlayViewController *pv = [PlayViewController new];
//    pv.productid = cm.ID;
//    [self.navigationController pushViewController:pv animated:YES];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    CGFloat height = scrollView.frame.size.height;
    CGFloat contentYoffset = scrollView.contentOffset.y;
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
    
    if (distanceFromBottom < height-50) {
        
      //  NSLog(@"滚动到底部");
       [self LoadMoreCourseData];
    }
    
}
-(void)LoadMoreCourseData
{    pageindex++;
    NSString *moreurl;
    if (btnmode == 0) {
        moreurl = [NSString stringWithFormat:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=0&pagesize=10&pageindex=%d&IsOwn=0&category_id=0",pageindex];
    }else if (btnmode == 1){
        moreurl = [NSString stringWithFormat:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=0&pagesize=10&pageindex=%d&IsOwn=1&category_id=0",pageindex];
    }else if (btnmode == 2){
        moreurl = [NSString stringWithFormat:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=565&pagesize=10&pageindex=%d&IsOwn=0&category_id=0",pageindex];
    }else if (btnmode == 3){
        moreurl = [NSString stringWithFormat:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=48&pagesize=10&pageindex=%d&IsOwn=0&category_id=0",pageindex];
    }else{
        moreurl = [NSString stringWithFormat:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetProductsByEnterpriseid&enterpriseid=24&cateid=%d&pagesize=10&pageindex=%d&IsOwn=0&category_id=0",btnmode,pageindex];
    }
    
  //  NSLog(@"输出btn 的mode%d",btnmode);
    WS(weakSelf)
    [BaseWebUtils Get:moreurl andParams:nil andCallback:^(id obj) {
        if (obj) {
           
            NSArray *dataArr = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];
         //    NSLog(@"输出数组 的mode%@",dataArr);
            if(![dataArr isKindOfClass:[NSArray class]]){
                return ;
            }
            
            for (NSDictionary *dic in dataArr) {
//                CoCourseModel *Cmd2=[[CoCourseModel alloc]initWithDictionary:dic error:nil];
//                [weakSelf.Carray addObject:Cmd2];
            }
            // NSLog(@"输出企业课程的数组%@",weakSelf.Carray);
            [weakSelf.CtableView reloadData];
        }

        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
