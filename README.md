# 🐴 Centaur - 数字体内核

> 人机融合体。在任何平台上都能从第一天带着自己的认知入场。

## 定位

```
                    Centaur（内核）
                    ┌─────────────┐
                    │ Soul        │ ← 你是谁
                    │ Identity    │ ← 你的角色 + 能力
                    │ Evolution   │ ← 你的认知资产
                    └──────┬──────┘
                           │ inject.sh 注入
          ┌────────┬───────┼───────┬────────┐
          ▼        ▼       ▼       ▼        ▼
     CodeBuddy  Claude  OpenClaw  Hermes  未来平台
               Code               Agent
          │        │       │       │        │
          └────────┴───────┴───────┴────────┘
                           │ 认知回流
                           ▼
                      Evolution
```

**平台来来去去，内核不丢。A 平台学到的，B 平台能用。**

## 架构

```
Soul ←──反哺──┐
  │            │
  ↓            │
Identity ←─反哺─┤
  │            │
  ↓            │
Task ──产出──→ Evolution（心脏）
```

- **Soul** — 你是谁，恒定的内核
- **Identity** — 你的角色 + 经验证的工作流程
- **Task** — 具体项目（不在本 repo 中，各项目自治）
- **Evolution** — 跨平台认知系统。insights 有生命状态：🌱新鲜 → 🔥验证中 → 🪨沉淀

## 目录结构

```
soul/                           ← 稳定的你
  principles.md                 ← 核心原则、协作关系
  preferences.md                ← 偏好习惯

identities/                     ← 你的角色
  engineer/                     ← 工程师
    README.md                   ← 通用工程原则
    harness-engineering.md      ← 从实践中长出来的流程
  writer.md                     ← 写作者
  learner.md                    ← 学习者

evolution/                      ← 认知系统（心脏）
  insights/                     ← 认知沉淀（按日期，三行格式+状态）
  frameworks/                   ← 方法论（归属待定）
  open-questions/               ← 待验证假设
  journal.md                    ← 演进日志

adapters/                       ← 平台注入
  inject.sh                     ← 注入脚本
```

## 使用方式

```bash
# 1. Clone
git clone git@github.com:yyship7/centaur.git ~/centaur

# 2. 注入到各平台
cd ~/centaur && ./adapters/inject.sh all

# 3. 日常：对话结束时 AI 追加 insight → git commit + push
```
