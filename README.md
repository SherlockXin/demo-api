**项目说明** 
- 项目源自[renren-fast](http://git.oschina.net/babaio/renren-fast)的企业版，针对企业的Java快速开发平台，引入部门管理、实现数据权限等功能
<br> 

**项目结构** 
```
renren-fastplus
├─doc  项目SQL语句
│
├─common 公共模块
│  ├─aspect 系统日志
│  ├─exception 异常处理
│  ├─validator 后台校验
│  └─xss XSS过滤
│ 
├─config 配置信息
│ 
├─modules 功能模块
│  ├─api API接口模块(APP调用)
│  ├─job 定时任务模块
│  ├─oss 文件服务模块
│  └─sys 权限模块
│ 
├─RegCoreApplication 项目启动类
│  
├──resources 
│  ├─mapper SQL对应的XML文件
│  ├─static 第三方库、插件等静态资源
│  └─views  项目静态页面

```
<br> 

**技术选型：** 
- 核心框架：Spring Boot 1.5
- 安全框架：Apache Shiro 1.3
- 视图框架：Spring MVC 4.3
- 持久层框架：MyBatis 3.3
- 定时器：Quartz 2.3
- 数据库连接池：Druid 1.0
- 日志管理：SLF4J 1.7、Log4j
- 页面交互：Vue2.x 
<br> 


 **本地部署**
- 通过git下载源码
- 创建数据库test，数据库编码为UTF-8
- 执行doc/jht-20181231.sql文件，初始化数据
- 修改application-dev.yml，更新MySQL账号和密码
- Eclipse、IDEA运行RegCoreApplication.java，则可启动项目
- 访问测试接口：http://localhost:8089/demo/api/notToken

- Swagger路径：http://localhost/swagger/index.html

**接口文档效果图：**
![输入图片说明](http://cdn.renren.io/img/72ef13cda8c64bf88b9c6e93f08cc065 "在这里输入图片标题")
<br> <br> <br> 

