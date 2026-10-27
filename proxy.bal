import ballerina/http;

// User-scoped keys (sk-ant-usr-...) require the anthropic-workspace-id header,
// which the Anthropic model provider cannot send. This local proxy adds it.
final http:Client anthropicUpstream = check new ("https://api.anthropic.com");

service /v1 on new http:Listener(anthropicProxyPort) {
    resource function post messages(http:Request req) returns http:Response|error {
        req.removeHeader("host");
        req.setHeader("anthropic-workspace-id", anthropicWorkspaceId);
        return anthropicUpstream->forward("/v1/messages", req);
    }
}
