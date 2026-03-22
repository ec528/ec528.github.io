#!/bin/bash

# EC528: 505错误演示脚本
# 使用方法: bash error-demo.sh [step]

set -e

DEMO_DIR="/Users/yigonghu/work/BU/teaching/ec528/website"
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 颜色输出函数
print_header() {
    echo -e "\n${BLUE}════════════════════════════════════════${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}════════════════════════════════════════${NC}\n"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# ==================== 步骤 1: 制造错误 ====================
step_1_create_error() {
    print_header "步骤 1️⃣ : 制造 Liquid 模板错误"
    
    print_info "修改 _layouts/ec440.html, 注释掉 endif..."
    
    # 1. 创建备份
    if [ ! -f "$DEMO_DIR/_layouts/ec440.html.backup" ]; then
        cp "$DEMO_DIR/_layouts/ec440.html" "$DEMO_DIR/_layouts/ec440.html.backup"
        print_success "已创建备份: ec440.html.backup"
    fi
    
    # 2. 插入错误（注释掉 endif）
    # 找到最后的 {% endif %} 并注释掉
    sed -i '' 's/{% endif %}/{% comment %} missing endif {% endcomment %}/g' "$DEMO_DIR/_layouts/ec440.html"
    
    print_success "已修改 ec440.html (缺少 endif)"
    echo "修改内容: {% endif %} → {% comment %} missing endif {% endcomment %}"
    
    read -p "按 Enter 继续到步骤 2..."
}

# ==================== 步骤 2: 观察错误 ====================
step_2_observe_error() {
    print_header "步骤 2️⃣ : 启动服务 & 观察错误"
    
    print_warning "现在启动 Jekyll 服务器，它会失败。按 Ctrl+C 停止"
    print_info "观察输出中的 'Liquid Exception' 错误"
    
    read -p "按 Enter 启动服务器..."
    
    cd "$DEMO_DIR"
    # 尝试启动，预期会失败
    bundle exec jekyll serve --trace 2>&1 | head -50
    
    print_warning "服务器启动失败（预期的）。按 Ctrl+C 停止..."
    read -p "按 Enter 继续到步骤 3..."
}

# ==================== 步骤 3: 详细诊断 ====================
step_3_diagnose() {
    print_header "步骤 3️⃣ : 详细诊断"
    
    print_info "使用 --trace 标志获取完整错误堆栈..."
    
    cd "$DEMO_DIR"
    bundle exec jekyll build --trace 2>&1 | grep -A 20 "Liquid Exception" || true
    
    echo ""
    print_info "关键信息：文件路径、行号、错误类型"
    
    read -p "按 Enter 继续到步骤 4..."
}

# ==================== 步骤 4: 查看原始文件 ====================
step_4_inspect_file() {
    print_header "步骤 4️⃣ : 检查有问题的文件"
    
    print_info "显示 _layouts/ec440.html 的内容："
    echo ""
    tail -10 "$DEMO_DIR/_layouts/ec440.html"
    
    echo ""
    print_warning "注意：缺少了 {% endif %}"
    
    read -p "按 Enter 继续到步骤 5..."
}

# ==================== 步骤 5: 修复错误 ====================
step_5_fix_error() {
    print_header "步骤 5️⃣ : 修复错误"
    
    print_info "恢复备份文件..."
    cp "$DEMO_DIR/_layouts/ec440.html.backup" "$DEMO_DIR/_layouts/ec440.html"
    
    print_success "已恢复 ec440.html"
    echo ""
    print_info "现在的内容："
    tail -5 "$DEMO_DIR/_layouts/ec440.html"
    
    read -p "按 Enter 继续到步骤 6..."
}

# ==================== 步骤 6: 验证修复 ====================
step_6_verify() {
    print_header "步骤 6️⃣ : 验证修复"
    
    print_info "构建网站..."
    cd "$DEMO_DIR"
    
    if bundle exec jekyll build --trace 2>&1 | grep -q "done in"; then
        print_success "✅ 网站构建成功！"
        print_success "修复完成！"
    else
        print_error "构建仍然失败，请检查"
    fi
    
    echo ""
    print_info "现在可以启动服务器："
    echo "  cd $DEMO_DIR"
    echo "  bundle exec jekyll serve"
}

# ==================== 步骤 7: 展示日志分析清单 ====================
step_7_log_analysis() {
    print_header "步骤 7️⃣ : 日志分析清单"
    
    cat << 'EOF'
当遇到 500 错误时，检查以下日志信息：

1️⃣  错误类型
    ├─ Liquid Exception: → 模板语法错误
    ├─ YAML error: → 配置文件错误  
    ├─ Gem::LoadError → 依赖错误
    └─ NoMethodError → 未定义的方法

2️⃣  错误位置
    ├─ 文件路径
    ├─ 行号
    └─ 上下文代码片段

3️⃣  根本原因分析
    ├─ 检查最近的代码变更
    ├─ 对比备份版本
    └─ 查看异常堆栈

4️⃣  修复策略
    ├─ 小改动：回滚代码
    ├─ 依赖问题：更新 Gemfile
    └─ 配置问题：验证 YAML 格式
EOF

    echo ""
    read -p "按 Enter 查看更多选项..."
}

# ==================== 主菜单 ====================
show_menu() {
    print_header "EC528: 505 错误演示"
    
    cat << 'EOF'
可用的演示步骤：

1. step_1_create_error   - 制造错误
2. step_2_observe_error  - 启动服务观察错误  
3. step_3_diagnose       - 详细诊断
4. step_4_inspect_file   - 检查问题文件
5. step_5_fix_error      - 修复错误
6. step_6_verify         - 验证修复
7. step_7_log_analysis   - 日志分析清单
8. full_demo             - 完整演示（自动执行）
9. cleanup               - 清理演示

使用方法:
  bash error-demo.sh step_1_create_error
  bash error-demo.sh full_demo
EOF
}

# ==================== 完整演示 ====================
full_demo() {
    print_header "🎬 完整演示开始"
    
    echo "这个演示将分为 6 个步骤"
    echo "每个步骤后按 Enter 继续"
    
    step_1_create_error
    step_3_diagnose
    step_4_inspect_file
    step_5_fix_error
    step_6_verify
    step_7_log_analysis
    
    print_success "演示完成！"
}

# ==================== 清理演示 ====================
cleanup() {
    print_header "清理演示"
    
    if [ -f "$DEMO_DIR/_layouts/ec440.html.backup" ]; then
        print_info "恢复备份文件..."
        cp "$DEMO_DIR/_layouts/ec440.html.backup" "$DEMO_DIR/_layouts/ec440.html"
        rm "$DEMO_DIR/_layouts/ec440.html.backup"
        print_success "已清理演示文件"
    else
        print_warning "未找到备份文件，跳过恢复"
    fi
}

# ==================== 主程序 ====================

if [ $# -eq 0 ]; then
    show_menu
else
    case "$1" in
        full_demo)
            full_demo
            ;;
        cleanup)
            cleanup
            ;;
        step_*)
            $1
            ;;
        *)
            echo "未知命令: $1"
            show_menu
            ;;
    esac
fi
