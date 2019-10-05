public class HttpResponseContext {
	private HttpResponse response;
	
    public HttpResponseContext(HttpResponse response) {
        this.response = response;        
    }

    public String getBody() {
        return this.response.getBody();
    }

    public Integer getStatusCode() {
        return this.response.getStatusCode();
    }

    public Boolean hasError() {
        return (this.response.getStatusCode() >= 300);
    }

}