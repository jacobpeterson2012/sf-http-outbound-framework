public class HTTPOutboundLogger {
    private Logger logger = LoggerFactory.getLogger(HTTPOutboundLogger.class);
    private HttpRequestContext requestctx;
    
    public HTTPOutboundLogger(HttpRequestContext requestctx) {
        this.requestctx = requestctx;   
    }
    public void logResponse(HttpResponseContext responsectx) {
        List<String> log = new List<String>();
        log.add(UserInfo.getUserName());
        log.add('[' + datetime.now().format('dd/MMM/yyyy:hh:mm:ss Z') + ']');
        log.add('"' + responsectx.getStatusCode() + '"');            
        this.logger.info(String.join(log, ' '));
        logBody(responsectx.getBody());
    }
    
    public void logRequest() {
        List<String> log = new List<String>();
        log.add(UserInfo.getUserName());
        log.add('[' + datetime.now().format('dd/MMM/yyyy:hh:mm:ss Z') + ']');
        log.add('"' + this.requestctx.getMethod() + ' ' + this.requestctx.getEndPoint() + '"');            
        this.logger.info(String.join(log, ' '));
        logBody(this.requestctx.getBody());
    }
    
    private void logBody(Object body) {
        if (body == null) {
            this.logger.debug('body: empty');
        } else {
            this.logger.debug('body: ' + body.toString());
        }
    }
}