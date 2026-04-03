DeltaForce API
===============

## 特性

* 基于PHP`8.0+`

> DeltaForce API的运行环境要求PHP8.0+

## 文档

[API文档](https://doc.apipost.net/docs/445c633fa47c000?locale=zh-cn)


## 安装

~~~
composer create-project coolxitech/deltaforce deltaforce
~~~

启动服务

~~~
cd deltaforce
php think run
~~~

然后就可以在浏览器中访问

~~~
http://localhost:8000
~~~

## Docker Compose 一键部署

项目默认使用 SQLite，本仓库已提供可直接用于 Linux 的 `compose.yaml` 和 `deploy.sh`。

部署步骤：

~~~
chmod +x deploy.sh
./deploy.sh
~~~

启动完成后访问：

~~~
http://服务器IP:8000
~~~

说明：

* 首次执行会自动将 `.example.env` 复制为 `.env`
* SQLite 数据库文件持久化到 `./data/df.db`
* 运行缓存目录持久化到 `./runtime`

如果你要改端口或切换 MySQL，直接编辑 `.env` 后重新执行：

~~~
docker compose up -d --build
~~~

如果需要更新框架使用
~~~
composer update coolxitech/deltaforce
~~~

## 命名规范

`ThinkPHP`遵循PSR-2命名规范和PSR-4自动加载规范。

## 参与开发

直接提交PR或者Issue即可

## 版权信息

DeltaForce API遵循CC BY-NC-SA 4.0开源协议发布，并提供免费使用以及二次分发,禁止商业用途并且不承担您在使用过程造成的法律责任。

以下为项目中使用的主要开源软件

ThinkPHP遵循Apache2开源协议发布，并提供免费使用。

版权所有Copyright © 2006-2024 by ThinkPHP (http://thinkphp.cn) All rights reserved。

ThinkPHP® 商标和著作权所有者为上海顶想信息科技有限公司。

更多细节参阅 [LICENSE](LICENSE)

## 打赏

![扫码打赏](https://cdn.jsdelivr.net/gh/coolxitech/coolxitech/rewarding.png)
