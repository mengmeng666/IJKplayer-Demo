//
//  ViewController.m
//  直播测试
//
//  Created by 董晓萌 on 17/3/23.
//  Copyright © 2017年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Model.h"
#import "TableViewCell.h"
#import "MJExtension.h"
#import "BFViewController.h"
static NSString * const Cell = @"cell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSMutableArray * array;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.array = [NSMutableArray array];

    _tableView = [[UITableView alloc]init];
    _tableView.frame = [UIScreen mainScreen].bounds;
    _tableView.backgroundColor = [UIColor redColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:Cell];
    [self loadData];
    
    [self.view addSubview:_tableView];


}
- (void)loadData{


    // 映客数据url
    NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";

    // 请求数据
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    [mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [mgr GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {

        //_model = [Model mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
        _array = [Model mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];

        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"%@",error);

    }];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   // NSLog(@"%@",_array);

    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Cell];

    cell.model = _array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    BFViewController * BFView = [[BFViewController alloc]init];
    BFView.model = self.array[indexPath.row];


    [self presentViewController:BFView animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 380;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
