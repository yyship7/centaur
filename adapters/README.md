# Adapters - 平台注入

> 把 Centaur 内核注入到各平台。一个脚本搞定。

## 使用方式

```bash
# 1. Clone 仓库
git clone git@github.com:yyship7/centaur.git ~/centaur

# 2. 注入到各平台
cd ~/centaur && ./adapters/inject.sh all

# 3. Soul/Identity 更新后重新注入
cd ~/centaur && ./adapters/inject.sh all
```

## 各平台注入位置

| 平台 | 注入位置 |
|------|----------|
| CodeBuddy | `~/.codebuddy/rules/digital-self.md` |
| Claude Code | `~/.claude/CLAUDE.md` |
| OpenClaw | `SOUL.md` + `USER.md` + `AGENTS.md` |
| Hermes Agent | `MEMORY.md` + `USER.md` |

## 知识回流

不需要暂存、不需要收割脚本。对话结束时 AI 直接追加到：

```
~/centaur/evolution/insights/YYYY-MM-DD.md
```

格式三行：判断、状态、来源。然后 `git commit + push`。
