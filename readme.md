# Document structure

model_fit/power_model.m 

model_fit/datasets 

chassis_power_control.c 


# Dependent tools, hardware and software environments
Toolchain/IDE : MDK-ARM V5

Deployment environment : RoboMaster/Development-Board-C-Examples/standard_robot

Hardware platform : STM32F4

# Supporting Documentation
Electric Vehicle Power Control.pptx Video presentation slides (In English)
    
[Video presentation](https://www.bilibili.com/video/BV1tu41177wm/) (In Chinese)


# Deployment method
1. Replacing the original power control file
    
2. Using a suitable supercapacitor control function






# 软件功能介绍
在超级电容出现后，传统的基于缓冲能量的功率控制已经不在适用。原因是一个理想的超级电容将会无条件的补偿超出最大功率的能量，在电容电量耗尽前，缓冲能量将不再
能反应电机功率与最大功率的关系，因此此时无法对底盘功率做出任何限制。为了让操作
手做出更多战术选择，实现主动释放超级电容能量，我们迫切需要一个新的底盘功率控制
算法。控制底盘功率的最直接的手段便是建立电机功率模型，直接计算出在当前时刻发送多
大的力矩可以让电机消耗指定的功率。从而令电机消耗任意大小的功率。
本算法基于广东工业大学给出的电机功率公式并在此基础上加以改进，优化了电机模
型公式的符号问题，使其考虑到了电机减速时可以输出的额外力矩。为了减少调参时间，
使用Matlab 对电机参数进行拟合。
同时发现现在网络上缺少关于C620 电调解释资料缺乏，本文档还详细的解释了Give
current, Given current, Real current & 力矩的相关概念。


# 软件效果展示
[电机恒功率启动视频](https://www.bilibili.com/video/BV1mN411p7Nj/)

其他图表见开源报告
# 依赖工具，软硬件环境

Toolchain/IDE : MDK-ARM V5

Deployment environment : RoboMaster/Development-Board-C-Examples/standard_robot
    
Hardware platform : STM32F4

# 文件目录结构及文件用途说明
model_fit/power_model.m 拟合代码

model_fit/datasets 电机功率数据集

chassis_power_control.c 功率控制代码

# 编译、安装方式
1. 替换原有功率控制文件
2. 使用合适的超级电容控制函数


# 软件与硬件的系统框图、数据流图
见开源报告

# 原理介绍与理论支持分析
见开源报告

# 未来优化的向（RoadMap）

需要对该电机功率模型的经验公式进行进一步优化，探讨有无其他相关项。

# 配套文档资料
Electric Vehicle Power Control.pptx 算法讲解幻灯片（英语）

[视频讲解](https://www.bilibili.com/video/BV1tu41177wm/) （中文）

开源报告 （中文）
