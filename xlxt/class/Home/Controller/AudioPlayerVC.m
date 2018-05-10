//
//  AudioPlayerVC.m
//  
//
//  Created by xlky on 2017/4/5.
//
//

#import "AudioPlayerVC.h"
#import "AudioCell.h"
#import "AudioModel.h"
#import "AudioView.h"
@interface AudioPlayerVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger Aindex;
    NSMutableArray *AudioArray;
}
@property (nonatomic,strong)UITableView *AtableView;
@property (nonatomic,strong)AudioModel *Amodel;
@property (nonatomic,strong)AudioView *AHView;
@property (assign)CGFloat cellheight;

@end

@implementation AudioPlayerVC

//懒加载

-(AudioView *)AHView
{
    if (!_AHView) {
        _AHView =[[AudioView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH/2.3)];
        
              WS(weakSelf);
        _AHView.block = ^(NSInteger AuId){
            [weakSelf addAudioPlayerWithID:AuId];
        };
        
    }
    return _AHView;
}
-(UITableView *)AtableView
{
    if (!_AtableView) {
        _AtableView = [[UITableView alloc]initWithFrame:MainFrame style:UITableViewStylePlain];
        AudioArray = [NSMutableArray array];
        _AtableView.delegate = self;
        _AtableView.dataSource = self;
    
        [self.view addSubview:_AtableView];
    }
    return _AtableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(AGoback)];
//
//    self.navigationItem.leftBarButtonItem = backItem;
WS(weakSelf);
    self.title = @"音频课程";
    [self AtableView];
    
    [self AHView];
    [self.AtableView registerClass:[AudioCell class] forCellReuseIdentifier:@"cell1"];
    
    self.AtableView.tableHeaderView = self.AHView;
    self.AtableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{

        [weakSelf LoadMoreAudioData];
    }];
    [self loadAudioData];

    
}
-(void)AGoback
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)loadAudioData
{
    WS(weakSelf);
    
    //推荐位数据
    NSString *AudioUrl =WWWURL(@"/Course/SeachCourseShow?cateID=47&pagesize=4&pageindex=1&keyword=");
    [BaseWebUtils Get:AudioUrl andParams:nil andCallback:^(id obj) {
        if(obj){

            NSArray * AHData = JsonObj(obj)[@"data"];
            weakSelf.AHView.Atarray = AHData;
            
             }
    }];
    //主页面数据
    Aindex = 1;
  NSString *Mainurl= [NSString stringWithFormat:@"/Course/SeachCourseShow?cateID=47&pagesize=9&pageindex=%ld&keyword=",Aindex];
    [BaseWebUtils Get:WWWURL(Mainurl) andParams:nil andCallback:^(id obj) {
        if(obj){
            AudioArray = [JsonObj(obj)[@"data"] mutableCopy];
            [self.AtableView reloadData];
        }

    }];
}

-(void)LoadMoreAudioData
{
    Aindex++;
        WS(weakSelf);
      NSString *Mainurl= [NSString stringWithFormat:@"/Course/SeachCourseShow?cateID=47&pagesize=9&pageindex=%ld&keyword=",Aindex];

    [BaseWebUtils Get:WWWURL(Mainurl) andParams:nil andCallback:^(id obj) {
        if (obj) {
             NSArray *arr = JsonObj(obj)[@"data"];
            if (arr.count == 0) {
                [weakSelf.AtableView.mj_footer endRefreshing];
                [weakSelf.AtableView reloadData];
                return;
            }
            for (NSDictionary *dic in arr) {
                   [ AudioArray addObject:dic];
            }
        [weakSelf.AtableView.mj_footer endRefreshing];
        [weakSelf.AtableView reloadData];
                }
    }];

    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return AudioArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AudioCell *Acell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    [Acell setSelectionStyle:UITableViewCellSelectionStyleNone];
    Acell.dic = AudioArray[indexPath.row];
    return Acell;
}


//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//
//
//    CGFloat height = scrollView.frame.size.height;
//    CGFloat contentYoffset = scrollView.contentOffset.y;
//    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
//
//    if (distanceFromBottom > height) {
//
//      [self LoadMoreAudioData];
//    }
//
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    AudioModel *selectmodel = self.Aarray[indexPath.row];
//    [self addAudioPlayerWithID:selectmodel.ID];
}


-(void)addAudioPlayerWithID:(NSInteger)AudioId
{
    
//    __block NSInteger index = 0;

//    [BaseWebUtils Get:@"http://m.xlxt.net/APP_Handler/ProductHandler.ashx?method=GetProductsByCateid&cateid=569" andParams:nil andCallback:^(id obj) {
//        if (obj) {
//
//
//        NSArray *arr = [NSJSONSerialization JSONObjectWithData:obj options:0 error:nil];
//        NSMutableArray *dataArray = [NSMutableArray array];
//
//        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//            NSDictionary *dic = obj;
//            MusicModel *model =[[MusicModel alloc]init];
//            [model setValuesForKeysWithDictionary:dic];
//
//            if ([model.ID integerValue] == AudioId) {
//                index = idx;
//            }
//
//            [dataArray addObject:model];
//        }];
//
//        AudioPlayerController *audio = [AudioPlayerController audioPlayerController];
//        audio.title = @"播放";
//        [audio initWithArray:dataArray index:index];
//        [self.navigationController pushViewController:audio animated:YES];
            
//        }
//    }];
   // NSLog(@"在音频列表输出id:%ld",AudioId);
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
