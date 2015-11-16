#VideoPlayerDemo

这个demo主要介绍了在ViewController中如何对播放器视图进行横竖屏的切换及其内部的工作原理。

demo中的横竖屏切换支持俩种方式

1. 手动强制横竖屏（通过点击横屏/退出按钮）
2. 旋转设备

####1. 手动强制横竖

通过直接修改视频播放器视图的transform属性来旋转和修改其frame属性来改变尺寸

####2. 旋转设备
通过观察操作系统发出的*UIDeviceOrientationDidChangeNotification*通知，然后通过修改视频播放器视图的transform属性来旋转和修改其frame属性来改变尺寸

####3. Demo截图
![Portrait](https://raw.githubusercontent.com/xuguojun/VideoPlayerDemo/master/VideoPlayerDemo/screenshot-portait.png)
![Landscape](https://raw.githubusercontent.com/xuguojun/VideoPlayerDemo/master/VideoPlayerDemo/screenshot-landscape.png)
