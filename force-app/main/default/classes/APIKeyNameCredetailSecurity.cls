public class APIKeyNameCredetailSecurity {
	private String credentialName;
    
    public APIKeyNameCredetailSecurity(String credentialName) {
    	this.credentialName = credentialName;
    }
    
    public void setRequest(HttpRequest request) {
        request.setEndpoint('callout:' + credentialName);        
        request.setHeader('Authorization', 'key={!$Credential.Password}');
    }    
}