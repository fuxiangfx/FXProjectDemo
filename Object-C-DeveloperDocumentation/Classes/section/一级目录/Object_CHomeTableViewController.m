//
//  Object_CHomeTableViewController.m
//  Object-C-DeveloperDocumentation
//
//  Created by xiang fu on 2018/1/23.
//  Copyright © 2018年 xiang fu. All rights reserved.
//

#import "Object_CHomeTableViewController.h"
#import "OCRuntimeTableViewController.h"

@interface Object_CHomeTableViewController ()

@end

@implementation Object_CHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 0.01)];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 1;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.textLabel.numberOfLines = 0;
        cell.detailTextLabel.numberOfLines = 0;
        cell.textLabel.text = @"sds发空间划分空间啊还是快点放假哈可视电话饭卡扫黄打非框架哈萨克的肌肤婚纱空间的划分空间阿斯顿发空间哈瞌睡的结合高科技啊点话费";
        cell.detailTextLabel.text = @"圣诞节卡就是打开房间啊可是觉得发空间啊还是等放假哈就是大家开始多久啊还是决定发哈教师的合法升级换代饭卡扫黄打非框架暗示的空间发哈是空间的";
    }
    if (indexPath.section == 0){
        if (indexPath.row == 0){
            cell.textLabel.text = @"Runtime";
            cell.detailTextLabel.text = @"Runtime的内容大概：动态获取类名、动态获取类的成员变量、动态获取类的属性列表、动态获取类的方法列表、动态获取类所遵循的协议列表、动态添加新的方法、类的实例方法实现的交换、动态属性关联、消息发送与消息转发机制";
        }
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) return @"Runtime";
    return @"---";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        if (indexPath.row == 0) {
            OCRuntimeTableViewController *controller = [[UIStoryboard storyboardWithName:@"MainStoryboard_iphone" bundle:nil] instantiateViewControllerWithIdentifier:@"oCRuntimeTableViewController"];
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

@end
