---
title: vim
subtitle: vim的基础操作
layout: post
author: orgaworl
header-style: text
tags:
  - vim
  - linux
---

---
## 操作

![[vi-vim-cheat-sheet-sch.gif]]



- 模式  
    - 默认模式  
        - 123h(jkl)  
            向左(右上下)移动123行
        - w  
            跳转到下一个单词开头  
        
        - b  
            前一个单词开头
        
        - gg  
            回到最上方
        
        - ctrl+u  
            向上翻页
        
        - ctrl+d  
            向下翻页
        
        - f要找的字符  
            移动
        
        - y+复制描述  
            复制
            -   
                例: y4j 复制下四行内容
            -   
                yaw 复制该单词
        - p  
            粘贴  

        - u  
            撤销操作
        
        - i  
            进入输入模式
    
    
    - 输入模式  
        - esc  
            回到默认模式
    
    - 命令模式  
        -   
            - :q -- 退出（这是:quit的缩写）  
            - :q! -- 不保存退出（这是:quit!的缩写）  
            - :wq -- 写入文件并退出（这是:writequit的缩写）  
            - :wq! -- （如果文件只有读权限）写入并退出；（如果文件没有写权限，强制写）  
            - :x -- 类似于:wq，如果文件无变动，那就不写入  
            - :qa -- 退出全部（这是:quitall的缩写）  
        
- vim ~/.aliases  
    编辑git自定义设置
- vim ~/.gitconfig








---
Author: **orgaworl**
Email: orgaworl@outlook.com
Github : [orgaworl/Course-Notes: SDU CyberScience (github.com)](https://github.com/orgaworl/Course-Notes)
Create: `2024-09-09` `15:13`
