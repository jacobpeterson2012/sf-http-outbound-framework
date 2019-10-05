public class EKSHttpSecuritySetter extends HttpSecuritySetterNamedCredentialAPIKey implements HttpSecuritySetter {
    public EKSHttpSecuritySetter() {
    	super('EKSNamedCredential');    
    }
}