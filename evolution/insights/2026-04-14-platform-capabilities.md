# 各 AI 平台的核心差异化能力

## 来源
- 日期：2026-04-14
- 身份：learner
- 平台：codebuddy
- 上下文：对比分析 Claude Code / OpenClaw / Hermes Agent / OpenAI Harness / Anthropic 三 Agent 架构

## 核心判断
各平台有不可替代的原生能力，Symbiosis 应利用而非替代它们。

## 分析

| 平台 | 核心差异化能力 | Symbiosis 如何利用 |
|------|---------------|-------------------|
| Claude Code | AutoDream（自动记忆巩固）+ 六层记忆架构 | 让它负责记忆整理，有价值的回流到 Evolution |
| OpenClaw | Heartbeat（主动定时任务）+ 七文件人格定义 | 让它定期检查 open-questions，注入到原生 SOUL.md/AGENTS.md |
| Hermes Agent | Skills 自进化（自动从执行轨迹生成可复用 Skills） | 不注入 playbooks，让它自己学习；成熟的 Skills 回流为 frameworks |
| OpenAI Harness | 声明式规则 + 自动化验证 + 基线守护 | Playbooks 描述理念，具体 Rules/Scripts 在各项目中实现 |
| Anthropic 三 Agent | Planning / Generation / Evaluation 分离 | 可作为 playbook 的一种模式使用 |

## 行动建议
- 定期更新此文件，跟踪各平台能力演进
- 新平台出现时，先分析其差异化能力，再决定如何集成
