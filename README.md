# JSONRPCom

 [![Build Status](https://travis-ci.org/andrewBatutin/JSONRPCom.svg?branch=master)](https://travis-ci.org/andrewBatutin/JSONRPCom)

 [![codecov](https://codecov.io/gh/andrewBatutin/JSONRPCom/branch/master/graph/badge.svg)](https://codecov.io/gh/andrewBatutin/JSONRPCom)

 [![codebeat badge](https://codebeat.co/badges/4100afcb-af49-4851-bf89-544f65ca6b57)](https://codebeat.co/projects/github-com-andrewbatutin-jsonrpcom)


JSON RPC serialization lib  for ObjC

What is [JSON RPC](http://www.jsonrpc.org/specification)?

#How to use?
```objective-c
[JSONRPCDeSerialization deSerializeString:message withJSONRPCRequset:^(JSONRPCRequest *data) {
        
    } orJSONRPCResponse:^(JSONRPCResponse *data) {
        
    } orJSONRPCNotification:^(JSONRPCNotification *data) {
        
    } orJSONRPCError:^(JSONRPCErrorResponse *data) {
        
    } serializationError:^(NSError *error) {
        
    }];
```

   
###Dependecies
* [Mantle](https://github.com/Mantle/Mantle)

