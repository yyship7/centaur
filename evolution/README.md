# Evolution - 跨平台认知系统

> Symbiosis 的心脏。**各平台产生的跨平台认知在这里汇聚、验证、成熟，最终反哺 Soul 和 Identity。**

## 定位

```
各平台（CodeBuddy / Claude Code / OpenClaw / Hermes / ...）
  │
  │ 跨平台认知回流
  ▼
evolution/
  ├── insights/         ← 洞察和判断
  ├── frameworks/       ← 可复用方法论（归属待定）
  └── open-questions/   ← 待验证假设
  │
  │ 成熟后反哺
  ▼
Soul / Identity → inject.sh → 所有平台同步更新
```

## 什么该回流，什么不该

| 该回流（跨平台认知） | 不该回流（平台级记忆） |
|----------------------|----------------------|
| 方法论、原则、判断 | 调试经验、API 路径、编译命令 |
| 跨身份通用的做事方式 | 某个项目的具体配置 |
| 经验证的假设结论 | 临时的操作步骤 |

## 整理机制

Evolution 不能无限增长。定期整理：

### 毕业规则
- insights 中反复验证的认知 → **毕业到 Soul（跨身份）或 Identity（单身份）**
- frameworks 中归属明确的 → **移入对应 Identity 的 playbooks/**
- open-questions 中已验证的 → 标记结论，反哺上层后归档

### 修剪规则（借鉴 AutoDream）
- 被证伪的洞察 → 删除或标记为 ❌
- 被新认知取代的旧认知 → 合并或删除
- 超过 6 个月无更新的 open-questions → 评估是否还有价值

### 容量参考
- insights/ 保持活跃条目 ≤ 30 条
- frameworks/ 保持待归属条目 ≤ 10 条
- open-questions/ 保持活跃条目 ≤ 15 条
- 超出时优先合并或毕业，而非无限增长
