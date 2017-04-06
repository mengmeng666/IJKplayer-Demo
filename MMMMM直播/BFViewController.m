
//
//  BFViewController.m
//  MMMMM直播
//
//  Created by 董晓萌 on 17/3/27.
//  Copyright © 2017年 wyzc. All rights reserved.
//

#import "BFViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "UIImageView+WebCache.h"
@interface BFViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong)IJKFFMoviePlayerController * player;
@end

@implementation BFViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    //占位图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_model.stream_addr]];

    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    [options setPlayerOptionIntValue:1  forKey:@"videotoolbox"];

    // 帧速率(fps) （可以改，确认非标准桢率会导致音画不同步，所以只能设定为15或者29.97）
    [options setPlayerOptionIntValue:29.97 forKey:@"r"];

    // -vol——设置音量大小，256为标准音量。（要设置成两倍音量时则输入512，依此类推
    [options setPlayerOptionIntValue:512 forKey:@"vol"];

    // 拉流地址
    NSURL * url = [NSURL URLWithString:_model.stream_addr];

   // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
    IJKFFMoviePlayerController * FFMovie = [[IJKFFMoviePlayerController alloc]initWithContentURL:url withOptions:options];

    FFMovie.scalingMode = IJKMPMovieScalingModeAspectFill;

    //播放默认是NO;给为YES;
    FFMovie.shouldAutoplay = YES;

    // 准备播放
    [FFMovie prepareToPlay];

    //开始播放
    [FFMovie play];

    // 强引用，反正被销毁
    _player = FFMovie;

    FFMovie.view.frame = [UIScreen mainScreen].bounds;

    [self.view insertSubview:FFMovie.view atIndex:1];

}
- (IBAction)fanhui:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    // 界面消失，一定要记得停止播放
    [_player pause];
    [_player stop];
    [_player shutdown];
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
