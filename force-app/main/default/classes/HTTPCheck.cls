/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 04-26-2023
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class HTTPCheck {
    //Making it sync now as we are not calling it from anywhere but from anonymous window for testing
    //Script below for Anonymous window:- HTTPCheck.httpCheckCallout('bar1', 'bar2');
    public static void httpCheckCallout(String foo1, String foo2){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://postman-echo.com/get?foo1='+foo1+'&foo2='+foo2);
        HTTPResponse response = new HTTPResponse();
        try{
            //API Call
            response = http.send(request);
            System.debug('res--->'+response);
            System.debug('Response Data->'+ response.getBody());
        }catch(Exception e){
            System.debug('Error--->'+ e.getLineNumber()+'--'+e.getMessage());
        }
    }
}