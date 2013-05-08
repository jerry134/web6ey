##Project Objective

##Deploy Address
http://wb6y.herokuapp.com
User: admin
Password: password

拥有管理员权限

##权限控制
参考wiki

##rspec测试覆盖率
Coverage report generated for RSpec to /home/ken/git_repo/web6ey/coverage. 124 / 168 LOC (83.93%) covered.
<br/>提交代码前，请维护测试

##部署
1.生成部署目录
cap deploy:setup

2.生成MYSQL数据库
mysql -u USERNAME -p
create database web6ey default character set utf8;
根据自身需求修改数据库配置（用户名，密码）
~/apps/web6ey/shared/config/database.yml

3.部署
cap deploy:cold

4.生成初始化数据
cap deploy:seed

5.更新代码重新部署
cap deploy
