# 🆘 Web 服务器 500 错误调试速查表

> 遇到 500 错误？别慌！按照这个流程一步步诊断。

---

## 🎯 30 秒快速诊断

```bash
# 1️⃣ 获取完整错误日志
bundle exec jekyll build --trace

# 2️⃣ 寻找这些关键词
grep -E "Error:|Exception|line [0-9]+" 

# 3️⃣ 打开文件，跳到指定行号
vim filename.html +42  # +行号
```

---

## 📖 常见错误识别手册

### 🔴 Liquid 模板错误

**标志：** 
```
Liquid Exception: Syntax Error in '...'
                  Syntax Error in '...'
```

**常见原因：**
```text
❌ {% if foo %}
     content
   {% endif %}  ← 缺少闭合

❌ {{ var | undefined_filter }}  ← 过滤器不存在

❌ {% for item in list %}
     ...
   {% endfor %}  ← 拼写错误（endfo 而不是 endfor）
```

**修复方法：**
1. 找到错误行号
2. 检查所有 "{\% if \%}" 是否有对应的 "{\% endif \%}"
3. 检查所有 "{\% for \%}" 是否有对应的 "{\% endfor \%}"
4. 检查过滤器是否存在

**验证命令：**
```bash
# 查看上下文
sed -n '38,45p' _layouts/ec440.html
```

---

### 🔴 YAML 配置错误

**标志：**
```
YAML syntax error in _config.yml / _data/...
          Expected '...'
```

**常见原因：**
```yaml
❌ title: "EC528  # 缺少闭合引号

❌ paginate: 5
 page_path: /page:num/  # 缩进错误

❌ - item: "value
     next_line: "xxx"  # 多行字符串格式错误
```

**修复方法：**
1. 检查引号是否配对：`"` 和 `"`
2. 检查缩进（使用 2 个空格或 Tab，但不要混用）
3. 检查列表 `-` 缩进是否一致

**验证命令：**
```bash
# 验证 YAML 语法（安装 yamllint）
yamllint _config.yml

# 或用 Ruby
ruby -ryaml -e 'YAML.load_file("_config.yml")' && echo "✅ Valid"
```

---

### 🔴 Gem 依赖错误

**标志：**
```
Gem::LoadError: ...
bundler: failed to load command: jekyll
```

**常见原因：**
```ruby
❌ gem "jekyll", "3.9"
   gem "minimal-mistakes-jekyll"  # 不兼容的版本

❌ gem "nonexistent-gem-name"  # gem 不存在
```

**修复方法：**
1. 打开 `Gemfile`
2. 检查版本号
3. 运行 `bundle install`
4. 查看冲突信息

**验证命令：**
```bash
bundle install --verbose
bundle check
bundle update --dry-run
```

---

### 🔴 文件不存在错误

**标志：**
```
Errno::ENOENT: No such file or directory
File not found: ...
```

**常见原因：**
```yaml
# _config.yml 配置的路径不存在
include:
  - _pages
  - nonexistent_folder/  ❌
```

**修复方法：**
1. 检查配置中的路径
2. 确保文件/文件夹存在
3. 检查相对路径是否正确

**验证命令：**
```bash
ls -la _pages/
ls -la 配置中提到的路径
```

---

## 🔍 日志分析 3 步法

### Step 1: 定位错误行

```
Liquid Exception: ... in '_layouts/ec440.html', line 42
                                              ^^^^^^ 这是你要看的行号
```

### Step 2: 查看错误上下文

```text
sed -n '38,45p' _layouts/ec440.html
#      ↓ (行号-4)  ↑ (行号+3) 显示前后上下文
```

输出示例：
```
38  {% if page.toc %}
39    <div class="toc">
40      {{ content }}
41    </div>
42  {% endif %}
43  {% comment %} ERROR IS HERE {% endcomment %}
44  
45  <footer>
46  </footer>
```

### Step 3: 对比正确版本

```text
# 查看 git 历史
git diff HEAD~1 _layouts/ec440.html | head -20

# 或者查看备份
diff _layouts/ec440.html _layouts/ec440.html.bak
```

---

## 🛠️ 修复工作流程

```
┌──────────────────────────┐
│ 1. 阅读完整错误消息      │ ← bundle exec jekyll build --trace
└────────┬─────────────────┘
         ↓
┌──────────────────────────┐
│ 2. 定位文件和行号        │ ← vim file.html +42
└────────┬─────────────────┘
         ↓
┌──────────────────────────┐
│ 3. 检查上下文            │ ← sed -n '38,45p' file.html
└────────┬─────────────────┘
         ↓
┌──────────────────────────┐
│ 4. 对比之前的版本        │ ← git diff
└────────┬─────────────────┘
         ↓
┌──────────────────────────┐
│ 5. 修复问题              │ ← vim file.html
└────────┬─────────────────┘
         ↓
┌──────────────────────────┐
│ 6. 验证修复              │ ← bundle exec jekyll build
└────────┬─────────────────┘
         ↓ (成功)
┌──────────────────────────┐
│ 7. 重启服务              │ ← bundle exec jekyll serve
└──────────────────────────┘
```

---

## 💻 常用命令速查

```bash
# 清空旧构建，重新开始
bundle exec jekyll clean && bundle exec jekyll build --trace

# 启用所有日志
JEKYLL_LOG_LEVEL=debug bundle exec jekyll serve

# 只看错误
bundle exec jekyll build 2>&1 | grep -i error

# 监视文件变化并构建
bundle exec jekyll build --watch

# 构建的同时启动服务
bundle exec jekyll serve --force-polling --watch

# 检查依赖
bundle check
bundle outdated
bundle audit

# 高级：用 ruby 验证配置  
ruby -ryaml -e 'puts YAML.load_file("_config.yml")'
```

---

## 🎯 症状 → 原因 快速表

| 症状 | 原因 | 命令 |
|------|------|------|
| `Liquid Exception` | 模板语法错误 | 检查 Liquid 标签 |
| `YAML error` | 配置格式错误 | yamllint 验证 |
| `Gem::LoadError` | 缺失 gem | bundle install |
| `No such file` | 路径错误 | ls -la 检查 |
| `Permission denied` | 权限错误 | chmod 644 修复 |
| `Connection refused` | 端口被占用 | lsof -i :4000 |
| `Address already in use` | 另一个进程占用端口 | kill $(lsof -t -i:4000) |

---

## 🚨 紧急修复

### 如果服务器一次次重启失败

```bash
# 1. 清理所有缓存
bundle exec jekyll clean
rm -rf .jekyll-cache/
rm -rf _site/

# 2. 重新安装依赖
bundle install
bundle update

# 3. 重新构建
bundle exec jekyll build --verbose

# 4. 如果还是不行，恢复上一个版本
git checkout HEAD~1
```

### 如果找不到问题在哪

```bash
# 1. 用二分法找到有问题的文件
# 临时注释掉一些 include，看是否还报错

# 2. 用 git 找到最近的改动
git log -p --follow -S "错误内容" -- .

# 3. 对比两个版本
git diff HEAD~5 HEAD > changes.patch
vim changes.patch  # 逐行查看
```

---

## 📝 调试笔记模板

复制这个，记录你的调试过程：

```markdown
## 问题描述
500 错误发生在 [日期/时间]

## 第一条错误信息
[粘贴完整错误消息]

## 文件和行号
- 文件: _layouts/ec440.html
- 行号: 42
- 错误: Liquid Exception

## 上下文代码
[粘贴相关的几行代码]

## 可能原因
[ ] 模板标签未闭合
[ ] 拼写错误
[ ] 过滤器不存在
[ ] 其他: ___

## 采取的行动
1. 检查了...
2. 修改了...
3. 验证了...

## 结果
[成功/失败]

## 学到的教训
[你学到了什么]
```

---

## 🎓 进一步学习

- 阅读 Jekyll 官方故障排除文档
- 学习 Liquid 模板语言
- 理解 Ruby Gems 和包管理
- 学会使用 git 追踪变更

---

**记住：** 日志永远不会说谎。它们可能很难读懂，但一旦你理解了，问题就清楚了。

💪 你可以做到！
