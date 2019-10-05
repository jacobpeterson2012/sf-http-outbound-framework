public class HttpRequestControllerOutbound implements HttpRequestController {
	private HttpRequestContext requestctx;
    
    public HttpRequestControllerOutbound(HttpRequestContext requestctx) {
    	this.requestctx = requestctx;   
    }
    
    public HttpResponseContext execute() {		        
        return new HttpResponseContext(new http().send(this.requestctx.getRequest()));
    }
}