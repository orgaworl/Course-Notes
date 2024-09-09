---
date created: 2024-09-09 15:25
date updated: 2024-09-09 15:43
title: "Git"
subtitle: "git的基本使用"
layout: post
author: "orgaworl"
header-style: text
tags:
 - git
 - github
---
> 好久好久以前整理的,当时还在用幕布....

## ADD
- add\
	添加文件到暂存区
	- git add 文件名1 文件名2 文件名3
	- git add .\
		所有改动的文件提交到暂存区\
		不会记录删除操作
	- git add --all\
		所有改动的文件提交到暂存区\
		会记录删除操作

- 生成公钥

	- ssh-keygen

	- ssh-keygen -t rsa\
		rsa加密

	- ssh-keygen -t rsa -C "注册邮箱"

	- ls -l ~/.ssh\
		查看key

- 冲突
	- 本地与远程仓库 同文件同行内容不同
		- 先pull,在手动解决冲突,最后push\
			pull后修改的内容全在同一文件中但顺序可能错误
	- 本地两分支文件 同行内容不同
		- 自动合并(被合并的在下)后手动解决冲突,再add ,commit

- 忽略文件
	- `/文件夹/`
		- 过滤文件夹
	- `*.jpg`
		- 过滤特定类型文件
	- `/文件夹/文件名`
		- 过滤具体文件
	- `!文件名`
		- 不过滤具体文件

- 项目搭建
	- 创建工作目录与常用指令

	- git init\
		本地仓库搭建

- git rm\
	删除文件，需要commit一次
## Branch
- git branch\
	查看本地分支
- git branch -a -r\
	所有 只远程
- git branch -d 分支名\
	须在在其他分支下时,才可删除该分支\
	在该分支未merge时不可用
- git branch 分支名\
	创建分支
- git branch -m old_name new_name\
	重命名分支
- git branch -D 分支名\
	在该分支未merge时可用
- git checkout 分支名\
	切换分支
- git checkout -b 新分支名/模板分支/commit\
	创建并切换,模板不填默认以当前分支为模板
- git checkout -b branch_name origin/branch_name\
	在本地创建本地分支并于远程分支关联
- git branch -vv\
	查看branch & track关联信息
- git branch --set-upstream debug origin/debug\
	关联本地仓库和远程仓库
- git push --set-upstream origin newbranch\
	关联本地仓库和远程仓库
- git remote show origin

## Commit
- merge  
    生成新commit记录合并
    
    - 先切换到主分支  
        
    
    - git merge 被合并的次分支名  
        合并分支  
        case1两分支commit数相同,拱形  
        case2被合并分支commmit数多于主分支,融合成一条
    
    - git merge --squash 被压缩合并次分支名  
        压缩后加入主分支,同时保留原分支
    
    - git merge --abort  
        merge后还未add时取消merge
    
    - 撤销(主分支上的)merge  
        - git reset --hard commitID  
            
- git rebase  
    作用分支的commit全接到主分支后
    
    - 切换到作用的分支  
        
    
    - 1 git rebase -i 主分支  
        
    
    - 2 手动解决冲突  
        
    
    - 3 add,commit 冲突文件  
        
    
    - 4 git rebase --continue  
        
    
    - 若还有矛盾则如上继续进行  
        
- git reset  
    重置所有缓存区操作
- git reset commitID  
    通过移动head ,回滚commit  
    ​(可起到压缩commit作用)
    
    - git reset commitID --soft  
        保留变更且变更内容处于staged(to be add&commit)
        - 头指针恢复，已经add的暂存区以及工作空间的所有东西不变  
            
    
    - git reset commitID --mixed (默认)  
        保留变更且变更内容处于modified
        - 头指针恢复，已经add的暂存区丢失掉，工作空间的代码不变的  
            
    
    - git reset commitID --hard  
        不保留所有变更
        - 全都恢复了，头指针恢复，add的暂存区消失，代码也恢复到以前状态  
            
    
    - git reset --hard HEAD^ #版本回退一个版本  
        
    
    - git reset --hard HEAD^^ #版本回退两个版本  
        
    
    - git reset --hard HEAD~100 #版本回退多个版本  
        
    
    - git checkout HEAD^ --filename  
        特定文件恢复到最近一次提交状态
    
    - git checkout -- filename  
        将文件撤销回到最近一次修改的状态  
        
- git revert commitID  
    - 该commit的修改无效化,其他所有commit的修改保留, 新建revert_commit记录(记录该commit的错误被改正)  
        
- 提交到版本库  
    
    - git commit -m "消息内容"  
        提交暂存区中的内容到本地仓库 -m 提交信息
    
    - git commit --amend  
        修改最近commit信息
    
    - git rebase -i HEAD~n pick 改成 edit git commit --amend git rebase --continue  
        修改倒数第n个commit信息
- git commit  
    - git commit --amend  
        重写上一次commit信息

## Log & Relog
- 配置  
    
    - git --version  
        查看版本
    
    - git config -list  
        查看配置
    
    - git config --system --list  
        #查看系统config
    
    - git config --global --list  
        #查看当前用户（global）配置
    
    - git config --global [user.name](http://user.name/) "zhangsan"  
        #名称
    
    - git config --global user.email 111111222334@qq.com  
        #邮箱
    
    - git config --global alias.new old  
        为常用命令设置别名
- 查看状态  
    
    - git status 文件名  
        #查看指定文件状态git
    
    - git status  
        #查看所有文件状态
- git log  
    查看版本日志
- git log filename  
    查看单个文件可回滚版本
- git log --oneline --decorate --graph -num  
    信息以一行输出 显示分支位置 图形化 显示数量
- git log -p -n  
    显示最近n次提交的内容差异。除了显示基本信息之外，还附带了每次 commit 的变化。
- git log --stat  
    看到每次提交的简略的统计信息，在每次提交的下面列出所有被修改过的文件、有多少文件被修改了以及被修改过的文件的哪些行被移除或是添加了。 在每次提交的最后还有一个总结。
- git log --pretty  
    指定使用不同于默认  
    ​格式的方式展示提交历史。
    
    - git log --pretty=oneline  
        将每个提交放在一行显示
    
    - git log --pretty=format：描述  
        定制要显示的记录格式
    
    - git log --pretty=format  
        常用的选项
- git log --author="XZY"  
    筛选日志
- git show commitID  
    查看编辑内容&改变文件
- git reflog  
    查看历史 版本回退操作
    
    - git reflog  
        查看历史
    
    - git reset --hard ID  
        回到过去


## Stash
- git stash  
    暂存该分支工作状态，以便切换到其他分支
    
    - git stash save "unfinished feature1"  
        将 "工作区" 中的改动暂时存着,以后一起commit
    
    - git stash list  
        查看现在存储了多少 "暂存变更"
    
    - git stash apply stash@{数字}  
        恢复被暂存的改动, ( 数字为list中显示数字
    
    - git stash show -p stash@{数字}  
        查看该暂存与现在工作进度的差距
    
    - git stash drop stash@{数字}  
        查看该暂存与现在工作进度的差距
    
    - 流程  
        
        - 1git stash  
            
        
        - 2git checkout 新分支  
            
        
        - 3操作  
            
        
        - 4git checkout 原分支  
            
        
        - 5git stash pop  
            在原分支中将状态恢复  
            会将list保存的列表也给删除掉
    
    -   
        
        - git stash apply  
            不会删除列表里的内容会默认恢复第一个
        
        - git stash apply list名称  
            恢复指定内容
        
        - git stash drop list名称  
            移除指定list
        
        - git stash clear  
            移除所有lsit
        
        - git stash show  
            查看栈中最新保存的stash和当前目录的差异。








## Remote
- remote

	- git remote add origin 仓库地址 #第一次将本地链接远程仓库

	- git remote add 仓库名 仓库地址\
		为本地项目添加远程关联仓库

	- git remote\
		当前配置项里有哪些远程仓库

	- git remote -v\
		查看所有关联仓库(详细)

	- git remote rm 仓库名\
		删除远程仓库

	- git remote show remote_res_name\
		远程仓库更新

	- `ssh -T [git@github.com](http://mailto:git@github.com/)\`
		检验ssh连接
- git remote prune\
	清除本地有而远程没有的
- clone\
	复制的整个版本库至本地（默认master分支）

	- git clone 仓库地址\
		克隆远程仓库

	- git clone -b 分支名 仓库地址\
		指定拉取的分支
- fetch

	- git fetch\
		​获取本地没有的更新\
		只会将本地库所关联的远程库的commit id更新至最新

	- git fetch --prune\
		获取本地没有的,清除本地有而远程没有的
- pull\
	更新本地库

	- git pull origin master\
		拉仓库(自动合并)

	- pull
		- ==fetch+merge
- push

	- git push\
		push：将本地仓库与远程仓库合并

	- git push -u origin master\
		第一次推向远程仓库（在已链接远程仓库情况下）

		- -u：将本地仓库分支与远程仓库分支一起合并，就是说将master的分支也提交上去，这样你就可以在远程仓库上看到你在本地仓库的master中创建了多少分支，不加这个参数只将当前的master与远程的合并，没有分支的历史记录，也不能切换分支

		- origin：远程仓库的意思，如果这个仓库是远程的那么必须使用这个选项

		- master：提交本地matser分支仓库

	- git push 远程仓库地址

	- git push -u res_name branch_to_push\
		建立追踪

	- git push --set-upstream origin 分支名\
		在远程仓库创建分支

	- git push --force\
		本地的当前分支 (usedForRollback) 和远端分支并不是父子关系，此时如果想要回退远端的 commit，就只能使用 git push --force 来强制 push

