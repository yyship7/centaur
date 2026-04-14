# 数字体框架应定位为跨平台内核，而非执行引擎

## 来源
- 日期：2026-04-14
- 身份：learner
- 平台：codebuddy
- 上下文：设计 Symbiosis 数字体框架时，对比 Claude Code / OpenClaw / Hermes Agent / OpenAI Harness / Anthropic 三 Agent 架构后得出

## 核心判断
个人数字体框架不应该试图替代各 AI 平台的执行和记忆能力，而应定位为**跨平台的认知内核**——做各平台做不了的事（人格一致性 + 跨平台知识流转），把执行和记忆管理交给各平台的原生能力。

## 分析
- 各平台已有成熟的执行和记忆机制：Claude Code 的 AutoDream、OpenClaw 的 Heartbeat、Hermes 的 Skills 自进化
- 在 Soul 里硬编码沉淀触发机制是错误的——这是各平台的事，且各平台实现方式不同
- Symbiosis 的独有价值是**跨平台人格一致性**，这是所有平台都没有的能力
- 框架应该利用各平台的独特能力，而非把它们抹平到最低公约数

## 行动建议
- Soul 只定义"我是谁"和"知识回流规则"，不定义执行细节
- adapters 负责注入内核 + 提供各平台原生能力利用指引
- Evolution 作为跨平台认知汇聚点，有毕业规则和容量控制
