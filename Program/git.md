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

## 基本流程

- `add => commit => push`
- `<= pull`
- `<= diff <= fetch`

## Local & Remote
- local 项目搭建
	- `git init`
		本地仓库搭建

- remote
	```shell
	git remote  # 当前配置项里有哪些远程仓库
		-v      # 详细查看所有关联仓库
		add origin <repAddr>    # 第一次将本地链接远程仓库
		add <repName> <repAddr> # 为本地项目添加远程关联仓库
		rm <repName>            # 删除远程仓库
		show <remoteRepName>    # 远程仓库更新
		prune                   # 清除本地有而远程没有的
	```

- 检验ssh连接
	`ssh -T [git@github.com](http://mailto:git@github.com/)`
	
	
- clone\
	复制的整个版本库至本地（默认master分支）
```shell
git clone <repAddr> # 克隆远程仓库
	-b <branchName> # 指定拉取的分支
```


- fetch
```shell
git fetch   # 获取本地没有的更新
	--prune # 获取本地没有的,清除本地有而远程没有的

```


- `pull`  更新本地库
	- `git pull origin master`
	- `pull` `==fetch+merge`



- `push`
	- `git push`
		push：将本地仓库与远程仓库合并

	- `git push -u origin master`
		第一次推向远程仓库（在已链接远程仓库情况下）

		- -u：将本地仓库分支与远程仓库分支一起合并，就是说将master的分支也提交上去，这样你就可以在远程仓库上看到你在本地仓库的master中创建了多少分支，不加这个参数只将当前的master与远程的合并，没有分支的历史记录，也不能切换分支

		- origin：远程仓库的意思，如果这个仓库是远程的那么必须使用这个选项

		- master：提交本地matser分支仓库

	- `git push <remoteAddress>`

	- `git push -u rep_name branch_to_push`\`
		建立追踪

	- `git push --set-upstream origin <branchName>`
		在远程仓库创建分支

	- `git push --force`
		本地的当前分支 (usedForRollback) 和远端分支并不是父子关系，此时如果想要回退远端的 commit，就只能使用 git push --force 来强制 push


- git push --set-upstream origin newbranch
	关联本地仓库和远程仓库
- git remote show origin

## Add&Rm
- add  添加文件到暂存区

```shell
git add 文件名1 文件名2 文件名3 
git add .      # 所有改动的文件提交到暂存区, 不会记录删除操作.
git add --all  # 所有改动的文件提交到暂存区, 会记录删除操作.
```

- git rm 删除文件(需要commit一次)



- 生成公钥
	- `ssh-keygen`
	- `ssh-keygen -t rsa`
	- `ssh-keygen -t rsa -C "email"`
	- `ls -l ~/.ssh`

- 冲突
	- 本地与远程仓库 同文件同行内容不同
		- 先pull,手动解决冲突,最后push (pull后修改的内容全在同一文件中但顺序可能错误.
	- 本地两分支文件同行内容不同
		- 自动合并(被合并的在下)后手动解决冲突,再add+commit.

- 忽略文件 `.gitignore`
```shell
/path/		# 过滤文件夹
*.jpg		# 过滤特定类型文件
/path/file	# 过滤具体文件
!file		#不过滤具体文件
```


## Branch
`git branch`
```shell
git branch # 查看本地分支
	-vv    # 查看branch & track关联信息
	-a     # show all branch
	-r     # remote branch
	-d <branchName> # 删除分支(在在其他分支下时),在该分支未merge时不可用
	-D <branchName> # 删除分支, 在该分支未merge时可用
	<branchName>    # 创建分支
	-m <oldName> <newName> #重命名分支 
	--set-upstream <branchName> <origin/BN> # 关联本地仓库和远程仓库
```
`git checkout`
```shell
git checkout 
	<branchName> #切换分支
	-b <branchName> #创建并切换到分支
	-b <branchName> <origin/branchName> #本地创建分支并与远程分支关联
```



## Commit
        
- `commit` 提交到版本库  
    ```shell
	git commit -m "message"  
        # 提交暂存区中的内容到本地仓库 -m 提交信息
    git commit --amend
        # 修改最近commit信息
	```


- merge  合并并生成新commit记录
    - 先切换到主分支,再进行:
	```shell
	git merge <toMergeBranch> # 合并
	git merge --squash <toSquashMergeBranch> 
	# 压缩后加入主分支,同时保留原分支
	git merge --abort   # merge后还未add时取消merge
	```
        

- git rebase  
    作用分支的commit全接到主分支后
    
    - 切换到作用的分支  
    - 1 git rebase -i 主分支  
    - 2 手动解决冲突  
    - 3 add,commit 冲突文件  
    - 4 git rebase --continue  
        
    - 若还有矛盾则如上继续进行  
        
- `git reset`  重置所有缓存区操作

	```shell
	git reset commitID  
		# 通过移动head ,回滚commit​(可起到压缩commit作用)
	
	git reset commitID --soft  
		# 保留变更且变更内容处于staged(to be add&commit)
		# 头指针恢复，已经add的暂存区以及工作空间的所有东西不变  
			
	git reset commitID --mixed (默认)  
		# 保留变更且变更内容处于modified
		# 头指针恢复，已经add的暂存区丢失掉，工作空间的代码不变的  
			
	git reset commitID --hard  
		# 不保留所有变更
		# 全都恢复了，头指针恢复，add的暂存区消失，代码也恢复到以前状态  
		
	git reset --hard HEAD^ #版本回退一个版本  
	git reset --hard HEAD^^ #版本回退两个版本  
	git reset --hard HEAD~100 #版本回退多个版本  

	```

```shell
git checkout HEAD^ --filename # 特定文件恢复到最近一次提交状态
git checkout -- filename      # 将文件撤销回到最近一次修改的状态  
```

```shell
git revert commitID  
   # 该commit的修改无效化,其他所有commit的修改保留, 新建revert_commit记录(记录该commit的错误被改正)  
git rebase -i HEAD~n pick 改成 edit git commit --amend git rebase --continue  
    # 修改倒数第n个commit信息
```
        



## Log & Relog
- 配置  
	```shell
	git config -list # 查看配置
	git config --system --list  #查看系统config
	git config --global --list  #查看当前用户（global）配置
	git config --global [user.name] <"name"> #名称
	git config --global [user.email] <email>   #邮箱
	git config --global alias.<new> <old>       # 为常用命令设置别名
	```

- 查看状态  
```shell
git status <fileName> #查看指定文件状态git
git status            #查看所有文件状态
```

```shell
git log   #查看版本日志
	filename  #查看单个文件可回滚版本
	--oneline --decorate --graph -num  #信息以一行输出 显示分支位置 图形化 显示数量
	-p -n  #显示最近n次提交的内容差异。除了显示基本信息之外，还附带了每次 commit 的变化。
	--stat #看到每次提交的简略的统计信息
	--pretty #指定使用不同于默认​格式的方式展示提交历史。
    --pretty=oneline # 将每个提交放在一行显示
    --pretty=format：# 描述定制要显示的记录格式
	--author="XZY"   # 筛选日志

```

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


