public class HttpRequestControllerOutbound implements HttpRequestController {
	private HttpRequestContext requestctx;
    private HTTPOutboundLogger logger;
    
    public HttpRequestControllerOutbound(HttpRequestContext requestctx) {
    	this.requestctx = requestctx;          
    }
    
    public HttpResponseContext execute() {		              
        //logging, retry etc to be added.       
        this.logger = new HTTPOutboundLogger(this.requestctx);   
        LoggerFactory.setCorrelationId(this.requestctx.getRequestId());
        HttpResponseContext responsectx = executeRequest();
        LoggerFactory.flush();
        return responsectx;
    }
    
    private HttpResponseContext executeRequest() {
        logger.logRequest();
        HttpResponseContext responsectx = new HttpResponseContext(new http().send(this.requestctx.getRequest()));        
        logger.logResponse(responsectx);     
        return responsectx;
    }        
}