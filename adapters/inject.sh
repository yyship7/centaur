#!/bin/bash

# Symbiosis - 平台注入脚本
# 把 Soul + Identity + 成熟 Playbooks 注入到各平台的规则目录
#
# 用法：
#   ./inject.sh all                     # 注入到所有已支持的平台
#   ./inject.sh codebuddy               # 只注入 CodeBuddy
#   ./inject.sh claude                  # 只注入 Claude Code
#   ./inject.sh openclaw                # 只注入 OpenClaw
#   ./inject.sh hermes                  # 只注入 Hermes Agent

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

GREEN='\033[0;32m'
NC='\033[0m'

# 拼接完整内核：Soul + Identity 通用原则 + 成熟 Playbooks + 成熟 Frameworks
# 附带 Symbiosis 仓库绝对路径，让 AI 知道去哪回流知识
assemble() {
    local git_remote=$(cd "$REPO_DIR" && git remote get-url origin 2>/dev/null || echo "未配置")
    local git_branch=$(cd "$REPO_DIR" && git branch --show-current 2>/dev/null || echo "unknown")

    echo "# ============================================"
    echo "# Symbiosis - Digital Self"
    echo "# 自动生成于 $(date '+%Y-%m-%d %H:%M:%S')"
    echo "# Symbiosis 仓库路径：$REPO_DIR"
    echo "# Git 远程仓库：$git_remote"
    echo "# Git 分支：$git_branch"
    echo "# ============================================"
    echo ""
    echo "# ========== Centaur 系统说明 =========="
    echo ""
    echo "# 这是一个跨平台的数字体内核系统。你正在读的内容来自 Centaur 仓库。"
    echo "# 仓库路径：$REPO_DIR"
    echo "# Git：$git_remote (branch: $git_branch)"
    echo "#"
    echo "# 【知识回流】"
    echo "# 对话结束时，如果产生了有跨项目/跨平台复用价值的认知，"
    echo "# 直接追加到 $REPO_DIR/evolution/insights/$(date '+%Y-%m-%d').md"
    echo "# 格式三行："
    echo "#   ## 标题"
    echo "#   判断：一句话核心判断"
    echo "#   状态：🌱 新鲜（未验证）"
    echo "#   来源：平台 + 上下文"
    echo "#"
    echo "# 状态流转：🌱 新鲜 → 🔥 验证中 → 🪨 沉淀"
    echo "# 后续对话中遇到相关场景时，主动更新状态。"
    echo "# 🪨 沉淀的认知可反哺到 Soul 或 Identity（需我确认）。"
    echo "#"
    echo "# 只沉淀跨项目/跨平台有价值的认知，不沉淀项目特定的细节。"
    echo "# 对话结束时主动提醒我是否有值得沉淀的内容。"
    echo "# 对话结束时，如果有值得沉淀的内容，主动提醒我。"
    echo ""
    echo "---"
    echo ""

    # Soul
    echo "# ========== Soul =========="
    echo ""
    for f in "$REPO_DIR"/soul/*.md; do
        [ -f "$f" ] && cat "$f" && echo "" && echo "---" && echo ""
    done

    # Identity 通用原则
    echo "# ========== Identities =========="
    echo ""
    for d in "$REPO_DIR"/identities/*/; do
        [ -f "$d/README.md" ] && cat "$d/README.md" && echo "" && echo "---" && echo ""
    done
    for f in "$REPO_DIR"/identities/*.md; do
        [ -f "$f" ] && cat "$f" && echo "" && echo "---" && echo ""
    done

    # 成熟的 Playbooks（状态为 🟢 或 🔵）
    local has_pb=false
    for d in "$REPO_DIR"/identities/*/playbooks/; do
        [ -d "$d" ] || continue
        for f in "$d"*.md; do
            [ -f "$f" ] || continue
            if grep -q "状态：.*🟢\|状态：.*🔵" "$f" 2>/dev/null; then
                has_pb=true
                break 2
            fi
        done
    done
    if [ "$has_pb" = true ]; then
        echo "# ========== 成熟的 Playbooks =========="
        echo ""
        for d in "$REPO_DIR"/identities/*/playbooks/; do
            [ -d "$d" ] || continue
            for f in "$d"*.md; do
                [ -f "$f" ] || continue
                if grep -q "状态：.*🟢\|状态：.*🔵" "$f" 2>/dev/null; then
                    cat "$f" && echo "" && echo "---" && echo ""
                fi
            done
        done
    fi

    # 成熟的 Frameworks
    local fw_dir="$REPO_DIR/evolution/frameworks"
    if [ -d "$fw_dir" ]; then
        local has_fw=false
        for f in "$fw_dir"/*.md; do
            [ "$(basename "$f")" = "README.md" ] && continue
            [ -f "$f" ] || continue
            if grep -q "状态：.*🟢\|状态：.*🔵" "$f" 2>/dev/null; then
                has_fw=true
                break
            fi
        done
        if [ "$has_fw" = true ]; then
            echo "# ========== 已验证的方法论（跨身份） =========="
            echo ""
            for f in "$fw_dir"/*.md; do
                [ "$(basename "$f")" = "README.md" ] && continue
                [ -f "$f" ] || continue
                if grep -q "状态：.*🟢\|状态：.*🔵" "$f" 2>/dev/null; then
                    cat "$f" && echo "" && echo "---" && echo ""
                fi
            done
        fi
    fi
}

inject_codebuddy() {
    local target="$HOME/.codebuddy/rules"
    mkdir -p "$target"
    assemble > "$target/digital-self.md"
    echo -e "${GREEN}✅ CodeBuddy${NC} → $target/digital-self.md"
}

inject_claude() {
    local target="$HOME/.claude"
    mkdir -p "$target"
    assemble > "$target/CLAUDE.md"
    echo -e "${GREEN}✅ Claude Code${NC} → $target/CLAUDE.md"
}

inject_openclaw() {
    local target="$HOME/.openclaw/workspace"
    mkdir -p "$target"
    # Soul 核心原则（去掉协作关系部分）→ SOUL.md
    cat "$REPO_DIR"/soul/principles.md > "$target/SOUL.md"
    # Preferences → USER.md
    cat "$REPO_DIR"/soul/preferences.md > "$target/USER.md"
    # Identity + Playbooks → AGENTS.md
    {
        for d in "$REPO_DIR"/identities/*/; do
            [ -f "$d/README.md" ] && cat "$d/README.md" && echo "" && echo "---" && echo ""
        done
        for f in "$REPO_DIR"/identities/*.md; do
            [ -f "$f" ] && cat "$f" && echo "" && echo "---" && echo ""
        done
    } > "$target/AGENTS.md"
    echo -e "${GREEN}✅ OpenClaw${NC} → SOUL.md + USER.md + AGENTS.md"
}

inject_hermes() {
    local target="$HOME/.hermes/memories"
    mkdir -p "$target"
    # Hermes 的 MEMORY.md 有 2200 字符限制，只注入 Soul 核心
    head -c 2200 "$REPO_DIR"/soul/principles.md > "$target/MEMORY.md"
    # USER.md 有 1375 字符限制，注入偏好摘要
    head -c 1375 "$REPO_DIR"/soul/preferences.md > "$target/USER.md"
    echo -e "${GREEN}✅ Hermes Agent${NC} → MEMORY.md + USER.md（受字符限制截断）"
    echo "   Hermes 的 Skills 自进化机制会自动从工作中学习，无需注入 Playbooks"
}

case "${1:-}" in
    codebuddy) inject_codebuddy ;;
    claude)    inject_claude ;;
    openclaw)  inject_openclaw ;;
    hermes)    inject_hermes ;;
    all)
        inject_codebuddy
        inject_claude
        inject_openclaw
        inject_hermes
        ;;
    *)
        echo "用法: $0 <codebuddy|claude|openclaw|hermes|all>"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}🧠 注入完成${NC}"
echo "   知识回流路径：$REPO_DIR/evolution/"
