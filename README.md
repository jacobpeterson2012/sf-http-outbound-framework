
  

# sf-http-outbound-framework
https://github.com/jacobpeterson2012/sf-http-outbound-framework

Status: POC

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
