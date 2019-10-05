public abstract class HttpSecuritySetterNamedCredentialAPIKey implements HttpSecuritySetter {
	private String credentialName;
    
    public HttpSecuritySetterNamedCredentialAPIKey(String credentialName) {
    	this.credentialName = credentialName;
    }
    
    public void setRequest(HttpRequest request) {
        request.setEndpoint('callout:' + credentialName);        
        request.setHeader('Authorization', 'key={!$Credential.Password}');
    }    
}