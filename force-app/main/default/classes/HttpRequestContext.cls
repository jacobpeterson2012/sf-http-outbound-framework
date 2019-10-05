public class HttpRequestContext {
	private HttpRequest request;
    private String path;
    private HttpSecuritySetter securitySetter;
	
    public HttpRequestContext(String method, HttpSecuritySetter securitySetter) {
        this.request = new HttpRequest();
        this.request.setMethod(method);
        this.securitySetter = securitySetter;
        this.securitySetter.setRequest(this.request);
    }
    
    public HttpRequest getRequest() {        
        this.SetEndPoint();
        return this.request;
    }

    public String getMethod() {
        return this.request.getMethod();
    }
    
    public String getPath() {
        return this.path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    
    private void setEndPoint(){
        this.request.setEndpoint(this.getEndPoint());
    }        
    public String getEndPoint(){
        return (this.request.getEndpoint() + this.path);
    }        
}