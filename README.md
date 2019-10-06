
  

  

# sf-http-outbound-framework

https://github.com/jacobpeterson2012/sf-http-outbound-framework

### Status: POC

# Motivation
This is a proposed framework to handle outbound HTTP calls from Salesfroce.

Target capabilities include:

- Resuable http execution pattern
- Logging
- Error handling
- Security handling - using named credentials to support security models


# Usage 
### Sample callout - available in this repo
```JavaScript
/* 
	Get instance of security setter for request.
*/
HttpSecuritySetter securitySetter = new EKSHttpSecuritySetter();
String httpMethod = 'GET';

/*
	Create new request. Passing in the security setter will set the 
	base url for the request from the name credential.
*/
HttpRequestContext ctx = new HttpRequestContext(securitySetter, securitySetter);

//Set resource path for request
ctx.setPath('/api/users/2');

/*
	Get request controller.  This may return a mock request handler 
	if defined in custom settings.
*/
HttpRequestController controller = HttpRequestControllerFactory.getHttpController(ctx);

//Execute request
system.debug(controller.execute().getBody());
```

To enable with or without mock custom meta data settings can be set - MockHTTPSetting__mdt
The current example loads a mock response from a static resource when method and endpoint pattern match.
  

In this example the common EKSHttpSecuritySetter - this is common is based on a common named credential for this org which as all outbound integrations should go through the same integration layer.

  
  

# Components
 
## Request Context
HttpRequestContext is used to build request.  This class wraps the standard HttpRequest class. 

## Response Context
HttpResponseContext is returned when a request is executed.  This class wraps the standard HttpResponse class. 

## HTTP Request Controller
This class is responsible for executing a request. HttpRequestController is an example implementation which executes a HttpRequestContext returning a HttpResponseContext.

HTTPMockStaticResourceLoader is an example of a controller used for a mock response implementation.


## Security Setter
Security Setter is responsible for setting request security settings.  This is required when creating a new HttpRequestContext.
  
APIKeyNameCredetailSecurity is an example implementation of this to set standard HttpRequest values from a named credential for an API key secured request.
