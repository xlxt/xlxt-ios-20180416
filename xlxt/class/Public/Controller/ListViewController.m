//
//  ListViewController.m
//  xlxt
//
//  Created by xlky on 2017/3/3.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.

#import "ListViewController.h"
#import "CourseListCell.h"
#import "DetailViewController.h"
@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger ReloadIndex;
    UIView *remenView;
    CGFloat reheight;
    UIButton *Morebtn;
}
@property (nonatomic)UITableView *tableview;
@property (nonatomic)UIView *topview;
@property (nonatomic)UIButton *newestbtn;
@property (nonatomic)UIButton *hotestbtn;
@property (nonatomic)UIButton *filtratebtn;
@property (nonatomic)NSMutableArray *DataArr;
@property (nonatomic)NSMutableArray *CataArr;
@property (nonatomic)NSDictionary *CataDic;

@end

@implementation ListViewController
-(instancetype)initWithId:(NSInteger)cateid
{
    self = [super init];
    if (self) {
        self.cateid = cateid;
        
    }
    return self;
}



//懒加载
-(UITableView *)tableview
{
    if (!_tableview) {
        
   //  __weak ListViewController *weakself=self;
        
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 104, kScreenW, kScreenH-104) style:UITableViewStylePlain];
        
        _tableview.delegate = self;
        _tableview.dataSource = self;

        [self.view addSubview:_tableview];
        
    }
    return _tableview;
}

-(UIView *)topview
{
    if (!_topview) {
        
        _topview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, 40)];
        _topview.backgroundColor = [UIColor colorWithRed:236/255.f green:235/255.f blue:235/255.f alpha:1];
        
        
        _filtratebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _filtratebtn.frame = CGRectMake(kScreenW-75, 0, 60, 40);
        
        [_filtratebtn setTitle:@"筛选 V" forState:UIControlStateNormal];
        [_filtratebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _filtratebtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_filtratebtn addTarget:self action:@selector(filtrateAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_topview];
        [_topview addSubview:_filtratebtn];
    }
    return _topview;
}
-(UIButton *)newestbtn
{
    if (!_newestbtn) {
        _newestbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _newestbtn.tag = 1;
        _newestbtn.frame = CGRectMake(kScreenW/25, 0, 40, 40);
        
        [_newestbtn setTitle:@"最新" forState:UIControlStateNormal];
        [_newestbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _newestbtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [_newestbtn addTarget:self action:@selector(NewORHotDataAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _newestbtn;
    
}

-(UIButton *)hotestbtn
{
    if (!_hotestbtn) {
    
        _hotestbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _hotestbtn.tintColor = [UIColor blueColor];
           _hotestbtn.frame = CGRectMake(kScreenW/25+40, 0, 45, 40);
        _hotestbtn.tag = 0;
         [_hotestbtn setTitle:@"最热" forState:UIControlStateNormal];
         [_hotestbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _hotestbtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
         [_hotestbtn addTarget:self action:@selector(NewORHotDataAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _hotestbtn;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
       self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    ReloadIndex = 1;
    self.navigationItem.title = @"课程列表";
    [self LoadDatas];
    self.title = self.Navititle;
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(Goback)];
    
    self.navigationItem.leftBarButtonItem = backItem;

    [self tableview];
    
//    Morebtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 35)];
//    Morebtn.backgroundColor = [UIColor colorWithRed:212/255.f green:234/255.f blue:246/255.f alpha:1];
//
//    [Morebtn setTitle:@"查看更多" forState:UIControlStateNormal];
//    [Morebtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [Morebtn addTarget:self action:@selector(LoadMoreDatas) forControlEvents:UIControlEventTouchUpInside];
//    self.tableview.tableFooterView = Morebtn;
    WS(weakself)
    self.tableview.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakself LoadMoreDatas];
    }];
    
    [self topview];
    [self.topview addSubview:self.hotestbtn];
    [self.topview addSubview:self.newestbtn];

    
      [self.tableview registerClass:[CourseListCell class] forCellReuseIdentifier:@"cell"];

}
-(void)Goback
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   // [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.Datadic = self.DataArr[indexPath.row];
  
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenH/6.5;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
 [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /*
     DetailViewController *detail = [DetailViewController new];
     
     
     detail.productid = [self.DataArr[indexPath.row][@"ID"] intValue];
     detail.SupplierID =[self.DataArr[indexPath.row][@"SupplierID"] intValue];
     
     [self.navigationController pushViewController:detail animated:YES];

     */
    
    
}

-(void)LoadDatas
{
    
 //   [self.tableview.footer ResetNomoreData];
    
      self.DataArr = [[NSMutableArray alloc]init];

    NSString *url = [NSString  stringWithFormat:@"/Course/GetCourseShow?newest=false&browseNum=false&reviewAvg=false&courseClassify=%ld&pagesize=9&pageindex=1&keyword=",(long)self.cateid];

    [BaseWebUtils Get:WWWURL(url) andParams:nil andCallback:^(id obj) {
             if (obj) {
        self.DataArr = JsonObj(obj)[@"data"];
       [_tableview reloadData];

             }
    }];

    NSString *CataUrl = [NSString stringWithFormat:@"/Course/GetCourseClassifyChildByInfoParentID?ParentID=%ld&Pagesize=100&Pageindex=1",(long)self.cateid];
    [BaseWebUtils Get:WWWURL(CataUrl) andParams:nil andCallback:^(id obj) {
        if (obj) {
        self.CataArr = JsonObj(obj)[@"data"];
        reheight = 30;

        if (![self.CataArr isKindOfClass:[NSNull class]]) {

        [self setreMenUIWithArray:self.CataArr];

       }
                }
    }];
    
    
}

-(void)NewORHotDataAction:(UIButton*)NH
{
         NSString *nh1 =NH.tag==1?@"true":@"false";
        NSString *url = [NSString  stringWithFormat:@"/Course/GetCourseShow?newest=%@&browseNum=false&reviewAvg=false&courseClassify=%ld&pagesize=9&pageindex=1&keyword=",nh1,(long)self.cateid];
    
        [BaseWebUtils Get:WWWURL(url) andParams:nil andCallback:^(id obj) {
              if(obj){
                  self.DataArr = JsonObj(obj)[@"data"];
              if (![self.DataArr isKindOfClass:[NSNull class]]) {
            [_tableview reloadData];
           
    
              }
              }
        }];
}


-(void)filtrateAction
{
    
        float i = 0;
        BOOL hide1;
        if (self.topview.frame.size.height == 40) {
           i = 40+reheight;
            hide1 = NO;
        }else{
            i = 40;
             hide1 = YES;
        }
         self.topview.frame= CGRectMake(0, 64, kScreenW, i);
        remenView.hidden = hide1;
   
}

-(void)LoadMoreDatas
{
    ReloadIndex ++;

        NSString *url = [NSString stringWithFormat:@"/Course/GetCourseShow?newest=false&browseNum=false&reviewAvg=false&courseClassify=%ld&pagesize=9&pageindex=%ld&keyword=",(long)self.cateid,(long)ReloadIndex];
    
    [BaseWebUtils Get:WWWURL(url) andParams:nil andCallback:^(id obj) {
        [self.tableview.mj_footer endRefreshing];
        if (obj == NULL) {
            return;
        }
        
        NSMutableArray * marray = [[NSMutableArray alloc]init];
        
        [marray addObjectsFromArray:self.DataArr];
        
        if ([JsonObj(obj)[@"data"] isKindOfClass:[NSNull class]]) {
       
        }else{
             [marray addObjectsFromArray:JsonObj(obj)[@"data"]];
        }

        
        self.DataArr = marray;
        
        [_tableview reloadData];
        
           }];
    
}

-(void)setreMenUIWithArray:(NSArray*)caArray
{
   
    
    remenView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, kScreenW, kScreenH-104)];
    remenView.backgroundColor = [UIColor clearColor];
    remenView.userInteractionEnabled = YES;
  
    float frameHeight =40;
    
    float butX = 15;
    float butY = 10;
    for(int i = 0; i < caArray.count; i++){
        
        //宽度自适应
        NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGRect frame_W = [caArray[i][@"Name"] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
        
        if (butX+frame_W.size.width+20>kScreenW-15) {
            
            butX = 15;
            
            butY += 30;
            frameHeight += 30;
        }
        
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(butX, butY, frame_W.size.width+20, 25)];
        [but setTitle:caArray[i][@"Name"] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        but.titleLabel.font = [UIFont systemFontOfSize:13];
        but.layer.cornerRadius = 8;
        but.layer.borderColor = [UIColor lightGrayColor].CGColor;
        but.layer.borderWidth = 1;
        but.tag = [caArray[i][@"ClassifyID"] integerValue];
        [but addTarget:self action:@selector(ChooseCourse:) forControlEvents:UIControlEventTouchUpInside];
        [remenView addSubview:but];
        butX = CGRectGetMaxX(but.frame)+10;
        
    }
    reheight = frameHeight;
    remenView.hidden = YES;
    [self.topview addSubview:remenView];

}

-(void)ChooseCourse:(UIButton*)but
{
    /*
     NSString *url = [NSString  stringWithFormat:@"http://m.xlxt.net/App_Handler/ProductHandler.ashx?method=GetNewProduct&cateid=%ld",(long)self.cateid];
     
     [BaseWebUtils Get:url andParams:nil andCallback:^(id obj) {
     
     self.DataArr = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];
     
     [_tableview reloadData];
     self.automaticallyAdjustsScrollViewInsets = YES;
     }];

     */
     [remenView removeFromSuperview];
    self.cateid = but.tag;
    self.topview.frame= CGRectMake(0, 64, kScreenW, 40);
    
    [self LoadDatas];

   // NSLog(@"输出btn的tag值：%ld",(long)but.tag);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
