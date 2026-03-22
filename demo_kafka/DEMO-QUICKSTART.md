# 📚 EC528: 505 错误演示 - 快速开始

## 📁 创建的材料清单

我为你创建了 **4 个完整的教学文档**：

### 1️⃣ **[505-ERROR-DEMO.md](docs/505-ERROR-DEMO.md)** - 完整设计方案
- 4 个不同的错误场景（Liquid、YAML、数据、依赖）
- 每个场景的制造方法
- 预期的日志输出
- 诊断步骤
- 推荐的教学流程
- 讨论题

**用途：** 备课准备、选择最适合的演示方式

---

### 2️⃣ **[TEACHING-NOTES.md](docs/TEACHING-NOTES.md)** - 详细讲义
- 课堂教学大纲（15-20 分钟）
- 分 6 个部分的演示脚本
- 关键讲解点
- 讨论题
- 进阶扩展
- 讲师贴士

**用途：** 上课时参考、讲解时使用

---

### 3️⃣ **[DEBUGGING-CHEATSHEET.md](docs/DEBUGGING-CHEATSHEET.md)** - 学生速查表
- 30 秒快速诊断
- 常见错误识别手册
- 日志分析 3 步法
- 修复工作流程
- 常用命令速查
- 症状→原因快速表
- 调试笔记模板

**用途：** 打印给学生、贴在办公室墙上、学生查阅

---

### 4️⃣ **[error-demo.sh](error-demo.sh)** - 自动化演示脚本
- 7 个独立的演示步骤
- 完整的自动流程
- 彩色输出和进度指示
- 自动的备份和恢复

**用途：** 课堂演示时快速执行

---

## 🚀 使用方法

### 方案 A: 完整自动演示（推荐给初学者）

```bash
cd /Users/yigonghu/work/BU/teaching/ec528/website

# 运行完整演示
bash error-demo.sh full_demo

# 清理演示（恢复原始状态）
bash error-demo.sh cleanup
```

### 方案 B: 分步演示（更具交互性）

```bash
# 步骤 1: 制造错误
bash error-demo.sh step_1_create_error

# 步骤 3: 诊断错误
bash error-demo.sh step_3_diagnose

# 步骤 4: 检查文件
bash error-demo.sh step_4_inspect_file

# 步骤 5: 修复错误
bash error-demo.sh step_5_fix_error

# 步骤 6: 验证修复
bash error-demo.sh step_6_verify
```

### 方案 C: 手动演示（最灵活）

1. 参考 [TEACHING-NOTES.md](docs/TEACHING-NOTES.md) 中的讲义
2. 手动修改文件
3. 展示日志输出

---

## 📊 演示流程概览

```
课堂演示流程 (20 分钟)
│
├─ 问题启发 (2 分钟)
│  "遇到 500 错误怎么办？"
│
├─ 制造错误 (3 分钟)
<!-- │  修改 _layouts/ec440.html，注释掉 {\% endif \%} -->
│
├─ 观察症状 (2 分钟)
│  运行 `jekyll serve`，看到 Liquid Exception
│
├─ 诊断错误 (5 分钟)
│  运行 `jekyll build --trace`，理解日志
│  定位文件和行号
│  检查错误上下文
│
├─ 修复错误 (3 分钟)
<!-- │  恢复 {\% endif \%} -->
│  重新构建和验证
│
└─ 讨论和扩展 (5 分钟)
   思考题、进阶场景、最佳实践
```

---

## 🎯 关键教学点

### 学生应该理解的 3 点

1. **日志是你的朋友**
   - 日志包含所有答案
   - 关键词：Error, Exception, line X
   - 学会解读日志

2. **诊断是一个过程**
   - 不是猜测，而是系统化
   - 收集信息 → 分析 → 验证 → 修复

3. **所有错误都是可修复的**
   - 有错误日志就有方向
   - 问题越明确，修复越容易

---

## 💡 演示的不同变体

### 如果你想展示不同的错误类型

#### 变体 1: YAML 配置错误

修改 `_config.yml`：
```yaml
title: "EC528  # ❌ 缺少闭合引号
```

日志会显示：
```
YAML syntax error in _config.yml line 17
```

---

#### 变体 2: Gem 依赖错误

修改 `Gemfile`：
```ruby
gem "jekyll", "3.9"  # ❌ 与 minimal-mistakes 不兼容
```

命令：
```bash
bundle update --dry-run
# 会显示版本冲突
```

---

#### 变体 3: 数据文件错误

修改 `_data/spring26_lecture.yml`：
```yaml
- lecture: 1
  topic: "Unclosed string  # ❌ 缺少闭合引号
```

---

## 📋 上课前检查清单

- [ ] 在本地测试过演示脚本
- [ ] 知道 `control+c` 如何停止 Jekyll
- [ ] 有备份副本（脚本会自动创建） 
- [ ] 准备好 TEACHING-NOTES 讲义
- [ ] 打印 DEBUGGING-CHEATSHEET 给学生
- [ ] 测试网络连接（如需现场直播）
- [ ] 投影仪/屏幕能清楚展示代码

---

## 🔄 演示后的反思

### 给学生的反思题

在他们的笔记中回答：

1. 你发现问题最关键的一条日志信息是什么？
2. 如果没有这条日志，你会如何调试？
3. 在生产环境中，这个错误会严重吗？

---

## 📚 延伸学习资源

### 推荐阅读
- [Jekyll Troubleshooting Guide](https://jekyllrb.com/docs/troubleshooting/)
- [HTTP Status Codes](https://httpwg.org/specs/rfc7231.html#status.5xx)
- [Liquid Documentation](https://shopify.github.io/liquid/)

### 推荐练习
1. 制造 YAML 错误，学生诊断
2. 制造依赖错误，学生诊断
3. 制造缺失文件错误，学生诊断

---

## 🎬 同步录屏演示

如果你想录制视频版本：

```bash
# 使用 asciinema 录屏
asciinema rec demo.cast

# 或使用 QuickTime (Mac)
# 简单演示通常 5-10 分钟足够
```

---

## 🤝 改进建议

### 如果你想自定义演示

编辑 `error-demo.sh`：
```bash
# 修改这些变量
DEMO_DIR="/your/path"
GREEN='\033[0;32m'  # 改变颜色

# 添加你自己的步骤函数
step_8_custom() {
    print_header "我的自定义步骤"
    # 你的代码
}
```

---

## ❓ 常见问题

### Q: 学生想要恢复文件怎么办？
```bash
# 最快的方式
git checkout _layouts/ec440.html
```

### Q: 如果多个学生同时在做呢？
```bash
# 每个人在自己的分支中
git checkout -b debug-demo-$studentname
# 做演示
git checkout main  # 恢复
```

### Q: 能在他们的笔记本电脑上做吗？
是的！只要他们有：
- Ruby (测试：`ruby --version`)
- Bundler (测试：`bundle --version`)
- Jekyll (测试：`jekyll --version`)

---

## 🎓 最后提示

> **最好的学习来自 *经历失败和修复*，而不仅仅是观看。**

考虑：
1. 让学生亲自修改文件
2. 让他们读日志找出问题
3. 让他们提出修复方案
4. 最后才告诉他们答案

这样他们会记得更深！

---

**准备好了？开始演示吧！** 🚀

需要帮助？参考 DEBUGGING-CHEATSHEET.md 或 TEACHING-NOTES.md

