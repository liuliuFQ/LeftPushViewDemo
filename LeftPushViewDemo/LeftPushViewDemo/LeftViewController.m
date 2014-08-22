//
//  LeftViewController.m
//  LeftPushViewDemo
//
//  Created by jhl on 14-8-22.
//  Copyright (c) 2014年 深联智达(北京). All rights reserved.
//

#import "LeftViewController.h"
#define kSCR_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kSCR_WIDTH [UIScreen mainScreen].bounds.size.width
@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray * array1;
@property(nonatomic,strong)NSArray * array2;
@property(nonatomic,strong)UITableView * tableView1;
@property(nonatomic,strong)UITableView * tableView2;
@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.array1 = [NSMutableArray arrayWithObjects:@"美食",@"娱乐",@"生活",@"电影",@"旅游",@"酒店", nil];
 
    
    
//    self.array2 = [NSMutableArray arrayWithObjects:@"美食",@"电影",@"娱乐",@"酒店",@"生活",@"美食",@"电影",@"娱乐",@"酒店",@"生活",@"美食",@"电影",@"娱乐",@"酒店",@"生活", @"娱乐",@"酒店",@"生活",@"美食",@"电影",@"娱乐",@"酒店",@"生活",nil];

    [self createTableView];
}
-(void)createTableView{

    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, kSCR_HEIGHT  - 20  ) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView1 = tableView;
    [self.view addSubview:self.tableView1];
    
    UITableView * tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(100, 0, 200, kSCR_HEIGHT - 20   ) style:UITableViewStylePlain];
    
    tableView2.delegate = self;
    tableView2.dataSource = self;
    self.tableView2 = tableView2;


}
#pragma mark------tableview.delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{   if([tableView isEqual:self.tableView1]){
    return [self.array1 count];
}else
    return [self.array2 count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{   if([tableView isEqual:self.tableView1]){
    UITableViewCell * cell ;
    
        cell = [[UITableViewCell alloc]init ];
    
    cell.textLabel.text = self.array1[indexPath.row];
    return cell;
}else{
    NSString * identifier = @"123";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text =self.array2[indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    NSArray * foodArray = @[@"烧烤",@"日韩料理",@"火锅",@"地方菜系",@"自助餐",@"粤菜",@"甜点饮品",@"新疆/清真",@"川菜",@"西餐",@"咖啡/酒吧/茶馆",@"快餐休闲",@"东南亚菜",@"海鲜",@"湘菜",@"茶餐厅",@"其他"];
    NSArray * playArray = @[@"KTV",@"游乐",@"温泉洗浴",@"养生按摩",@"演出/赛事/展览",@"门票郊游",@"桌游/密室",@"运动健身",@"DIY手工",@"电影票",@"农家乐/采摘",@"真人CS",@"电玩",@"其他"];
    NSArray * lifeArray = @[@"丽人",@"配镜",@"鲜花婚庆",@"体检保健",@"家庭亲子",@"摄影写真",@"快照冲印",@"培训课程",@"汽车服务",@"宠物",@"洗衣店",@"服装定制",@"其他生活"];
    
    if ([tableView isEqual:self.tableView1]) {
        
        self.tableView2.backgroundColor = [UIColor lightGrayColor];
        switch (indexPath.row) {
            case 0:
            {
                self.array2 = foodArray;
                [self.view addSubview:self.tableView2];
                [self.tableView2 reloadData];
            }
                break;
            case 1:
            {
                self.array2 = playArray;
                [self.view addSubview:self.tableView2];
                [self.tableView2 reloadData];
            }
                break;
            case 2:
            {
                self.array2 = lifeArray;
                [self.view addSubview:self.tableView2];
                [self.tableView2 reloadData];
            }
                break;
                
            default:
                break;
        }
        if (indexPath.row > 2) {
            if (self.category) {
                self.category(self.array1[indexPath.row]);
            }
            [self.revealSideViewController popViewControllerAnimated:YES];
          
        }
    }
    if([tableView isEqual:self.tableView2]){
        if (self.category) {
            self.category(self.array2[indexPath.row]);
        }
        [self.revealSideViewController popViewControllerAnimated:YES];
    
    }


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
