
  

  

# sf-http-outbound-framework

https://github.com/jacobpeterson2012/sf-http-outbound-framework


### Status: POC

This is a proposed framework to handle outbound HTTP calls from Salesfroce.

Target capabilities include:

- Resuable http execution pattern
- Logging
- Error handling
- Security handling - using named credentials to support security models


#### Sample callout - available in this repo
```sh
HttpRequestContext ctx = new HttpRequestContext('GET', new EKSHttpSecuritySetter());
ctx.setPath('/api/users/2');
HttpRequestController controller = HttpRequestControllerFactory.getHttpController(ctx);
system.debug(controller.execute().getBody());
```

To enable with or without mock custom metad data settings can be set - MockHTTPSetting__mdt
The current example loads a mock response from a staic resource when method and endpoint pattern match.
  

In this example the common EKSHttpSecuritySetter - this is common is based on a common named credentail for this org which as all outbound integrations should go through the same integration layer.

  
  

# Components
 
## Request Context

## Response Context

## Security Setter

## HTTP Request Controller