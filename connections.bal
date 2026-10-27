import ballerinax/ai.anthropic;

final anthropic:ModelProvider anthropicModelProvider = check new (anthropicApiKey, anthropic:CLAUDE_SONNET_4_6, string `http://localhost:${anthropicProxyPort}/v1`);
