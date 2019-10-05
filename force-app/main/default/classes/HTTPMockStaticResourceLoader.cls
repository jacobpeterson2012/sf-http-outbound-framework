public class HTTPMockStaticResourceLoader implements HttpRequestController, MockHttpRequestController {
    
    private MockHTTPSetting__mdt mocksettings;
    
	public HttpResponseContext execute() {		        
        
        InputSetting inputs = (InputSetting) JSON.deserialize(this.mocksettings.HandlerInputs__c, InputSetting.class);        
        
        //refactor to another method
        HttpResponse response = new HttpResponse();
        response.setBody(JSON.serialize(inputs)); //change to read static resource
        response.setStatusCode(200);
        return new HttpResponseContext(response);
    }
    
    public void setMockHTTPSettings(MockHTTPSetting__mdt setting) {
        this.mockSettings = setting;
    }

    private class InputSetting {
    	public String StaticResourceName;        
    }
   
}