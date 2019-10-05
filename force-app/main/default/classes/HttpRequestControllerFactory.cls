public class HttpRequestControllerFactory {

    private static List<MockHTTPSetting__mdt> mockhandlers;
    
    static {
        mockhandlers = [SELECT id, EndPointMatchPattern__c, 
						MockHandlerClass__c, HTTPMethod__c, HandlerInputs__c
                        FROM MockHTTPSetting__mdt
                        WHERE Active__c = true
                       ];
    }
    
    public static HttpRequestController getHttpController(HttpRequestContext requestctx) {    
        return getController(requestctx);
    }

    private static HttpRequestController getController(HttpRequestContext requestctx) {
        MockHTTPSetting__mdt mockSetting = findMockController(requestctx);
        
        if (mockSetting != null) {
            return createMockController(mockSetting);
        }        
        return new HttpRequestControllerOutbound(requestctx);
    }
    
    private static MockHTTPSetting__mdt findMockController(HttpRequestContext requestctx) {
        for (MockHTTPSetting__mdt mockSetting : mockHandlers) {			
            if (requestctx.getMethod() == mockSetting.HTTPMethod__c                 
                && isPatternMatch(mockSetting.EndPointMatchPattern__c, requestctx.getEndPoint())) {
                	
               return mockSetting;
            }
        }
        return null;
    }
    
    private static Boolean isPatternMatch(String pattern, String endpoint) {        
        //change to match using regex - simple match for the moment.        
       	return endPoint.contains(pattern);
    }
    
    private static HttpRequestController createMockController(MockHTTPSetting__mdt mockSetting ) {
        Object obj = getInstance(mockSetting.MockHandlerClass__c);
        
        if (!isControllerType(obj) || !isMockControllerType(obj)) {
            return null; //throw exception etc
        }            
        
        MockHttpRequestController ctl = (MockHttpRequestController) obj;
        ctl.setMockHTTPSettings(mockSetting);
        return (HttpRequestController) ctl;
    }
        
    private static Boolean isControllerType(Object obj) {
        if (obj != null && obj instanceof HttpRequestController) {
            return true;
        }
        return false;
    }

    private static Boolean isMockControllerType(Object obj) {
        if (obj != null && obj instanceof MockHttpRequestController) {
            return true;
        }
        return false;
    }

    private static Object getInstance(String className) {
        Type t = Type.forName(className);
        return t.newInstance();
    }
}