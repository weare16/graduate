# graduate
软件实训2项目结构介绍
——src 后端代码总包
   ————pojo 实体类包
   ————util 工具类包
   其他包是功能包，以每一个系统二级菜单功能为单元。
 ————applicationContext.xml Spring配置文件
 ————jdbc.properties   数据库连接配置文件
 ————log4j.properties  日志文件
 ————sysconfig.properties 系统自定义文件
 ———WebRoot 
    ——common 前端框架文件
    ——css  存放CSS文件
    ——js  存放js文件
   ——WEB-INFO
    ——lib 项目框架后端jar包
    ——pages 前端页面存放文件夹，以每一个系统二级菜单功能为单元构建子文件夹 ，存放前端jsp页面
    ——tld 前端功能文件夹
    ——web.xml 项目配置文件
    ——mtecc_servelt.xml servelt 配置文件
