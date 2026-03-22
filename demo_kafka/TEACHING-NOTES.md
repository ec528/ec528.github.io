# 505 错误演示：课堂讲义

## 🎯 本课目标

学生将理解：
- 什么是 HTTP 500/505 错误
- 为什么以及如何发生在 Web 服务中
- 如何通过日志诊断并修复问题
- 实际的调试工作流程

---

## 📋 演示概要 (15-20 分钟)

### 第一部分：引入 (2 分钟)

**问题启发：**
> "想象你是运维工程师。一个开发人员说：'我的网站返回 500 错误了，不知道什么原因。能帮我看看吗？' 你需要怎么做？"

**关键点：**
- 不直接看代码，先看日志
- 日志里有答案
- 像侦探一样分析证据

---

## 🔴 第二部分：制造错误 (3 分钟)

### 背景知识

```
基本流程：
用户请求 → Web 服务器 → 应用逻辑 → 数据库
              ↓ 
          如果任何一步失败 → 500 Error
```

对于 Jekyll：
```
git commit → 代码变更 → Jekyll 构建 → 渲染模板
                        ↓
                    Liquid 引擎失败 → 500 Error Tell
```

### 演示操作

```bash
# 我们将修改模板文件，引入一个语法错误
vim _layouts/ec440.html

# 找到这一行：
# {\% endif \%}

# 注释掉（或删除）→ Liquid 模板不完整
# 这会导致构建失败
```

**讲解重点：**
- 这是开发中常见的错误（缺少闭合标签）
- 在本地测试中本应被发现
- 但有时会偷偷溜到生产环境

---

## 🔍 第三部分：观察症状 (2 分钟)

### 错误显示

学生看到的：

**浏览器：**
```
500 Internal Server Error
The server encountered an unexpected condition that prevented it from fulfilling the request.
```

**服务器日志：**
```
Configuration file: /path/_config.yml
Generating...
  Liquid Exception: Syntax Error in 'ec440.html'  
                    line 42: 'endif' expected
                    
jekyll 4.2.0 | Error: Syntax Error
```

### 讨论点

1. 用户看到什么？
   - 只看到 500 错误
   - 不知道发生了什么

2. 运维人员看到什么？
   - 详细的日志
   - 具体的错误位置

---

## 🔎 第四部分：诊断 (5 分钟)

### 第一步：获取完整日志

```bash
# 使用 --trace 标志
bundle exec jekyll build --trace
```

**日志输出示例：**

```
Generating...
  Liquid Exception: Syntax Error in '_layouts/ec440.html', line 42
    Expected 'endif' in 'if' block started on line 38
    
Traceback (most recent call last):
  ...liquid/tags/if.rb:29:in `end_tag'
  ...liquid/lexer.rb:125:in `parse'
  ...
```

关键信息：
- ✅ 错误类型：Liquid Exception
- ✅ 文件：_layouts/ec440.html
- ✅ 行号：42
- ✅ 问题描述：缺少 `endif`
- ✅ 上下文：开始于第 38 行的 if 块

### 第二步：检查文件

```
$ cat _layouts/ec440.html | head -45 | tail -10
36  {\% if page.toc \%}
37    <div class="toc">
38      {{ content | toc_filter }}
39    </div>
40  {\% comment \%} missing endif {\% endcomment \%}  ← 问题在这里
41  
42  <footer>
```

**分析：**
- 第 36 行开启了 `if` 块
- 但没有对应的 `endif`
- 第 40 行是个注释而不是 `endif`

### 第三步：对比检查

```bash
# 查看 git diff
git diff _layouts/ec440.html

# 或者与上一个工作版本比较
diff _layouts/ec440.html.backup _layouts/ec440.html
```

**结果：**
```
- {\% endif \%}
+ {\% comment \%} missing endif {\% endcomment \%}
```

---

## 🔧 第五部分：修复 (3 分钟)

### 修复步骤

```bash
# 1. 编辑文件
vim _layouts/ec440.html

# 2. 找到问题行
# 把这行：
# {\% comment \%} missing endif {\% endcomment \%}
# 改回：
# {\% endif \%}

# 3. 保存文件
# :wq
```

### 验证修复

```bash
# 重新构建
bundle exec jekyll build

# 预期输出：
#   Generating...
#   done in 2.345 seconds.
#
# 没有错误消息 = 成功！
```

---

## ✅ 第六部分：恢复服务 (2 分钟)

```bash
# 重启服务器
bundle exec jekyll serve

# 访问网站
# http://localhost:4000
```

**验证：**
- 页面加载正常
- 没有 500 错误
- 功能正常

---

## 📊 关键学习成果

### 1. 错误诊断流程

```
遇见 500 错误
      ↓
查看服务器日志
      ↓
识别错误类型（Liquid/YAML/Gem/etc）
      ↓
定位文件和行号
      ↓
检查代码上下文
      ↓
想到可能的原因
      ↓
修复
      ↓
测试验证
```

### 2. 常见的 500 错误原因

| 原因 | 症状 | 诊断 | 修复 |
|------|------|------|------|
| Liquid 模板错误 | `Liquid Exception: Syntax Error` | 查看行号 | 修复标签 |
| YAML 配置错误 | `YAML syntax error` | 验证缩进 | 修改格式 |
| 缺失的 gem | `Gem::LoadError` | 检查 Gemfile | 运行 bundle install |
| 权限错误 | `Permission denied` | 检查文件权限 | chmod 644 |
| 磁盘满 | `Write error` | 检查磁盘 | 清理空间 |

### 3. 日志阅读技能

**关键词扫描：**
- `Error:` - 什么出错了
- `in file 'xxx':` - 在哪里
- `line XXX` - 第几行
- `Traceback` - 详细调用栈

**信息优先级：**
1. 最后一行（具体错误信息）
2. 行号（精确位置）
3. 堆栈跟踪（连锁反应）

---

## 🎓 课后思考题

### 给学生的讨论问题

1. **如果在生产环境遇到这个错误，用户会看到什么？**
   - 404 页面？
   - 错误页面？
   - 空白页面？

2. **如何防止这个错误上线？**
   - CI/CD 测试？
   - 代码审查？
   - 本地测试？

3. **如果有 1000 个访问者同时遇到 500 错误，会发生什么？**
   - 服务器是否会崩溃？
   - 日志是否会爆炸？
   - 如何恢复？

4. **在 Django/Flask/Rails 中，错误诊断会不同吗？**
   - 日志格式是否不同？
   - 调试工具有哪些？

5. **CDN 会如何影响这个错误？**
   - CDN 是否会缓存 500 错误？
   - 用户会看到多久的旧页面？

---

## 💡 进阶扩展

### 变体演示（可选）

**演示 2：YAML 配置错误**
```yaml
# 在 _config.yml 中引入错误
title: "EC528  # 缺少闭合引号
```

**演示 3：Gem 依赖冲突**
```ruby
# 在 Gemfile 中
gem "jekyll", "3.9"  # 太旧
gem "minimal-mistakes-jekyll", "4.24"  # 需要 Jekyll 4.x
```

---

## 📺 课堂演示检查清单

- [ ] 在安全的环境中（本地）做演示
- [ ] 提前做一遍，知道会发生什么
- [ ] 准备好截图或录屏
- [ ] 解释 3 个关键的日志行
- [ ] 演示修复过程
- [ ] 验证服务恢复
- [ ] 讨论预防措施

---

## 🚀 配合的命令速度表

```bash
# 快速制造错误
sed -i '' 's/{\% endif \%}/<!-- BROKEN -->/g' _layouts/ec440.html

# 快速查看错误
bundle exec jekyll build 2>&1 | head -20

# 快速恢复备份
git checkout _layouts/ec440.html

# 快速验证修复
bundle exec jekyll build && echo "✅ Success"
```

---

## 📚 参考资源

- [Jekyll 官方文档 - Troubleshooting](https://jekyllrb.com/docs/troubleshooting/)
- [Liquid 模板语言](https://shopify.github.io/liquid/)
- [HTTP 状态码参考](https://httpwg.org/specs/rfc7231.html#status.5xx)
- [常见 Ruby 错误](https://ruby-doc.org/core/)

---

**讲师贴士：** 这个演示最强大的部分是让学生 *亲自* 经历错误诊断过程，而不仅仅是看你操作。考虑让每个学生修复一个故意制造的不同错误。
