public with sharing class InteractionController {

    @AuraEnabled
    public static String  makePostCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
      // request.setEndpoint(Url.getOrgDomainUrl().toExternalForm() + '/services/apexrest/Interactions/');
        request.setEndpoint('callout:InteractionsCrea' + '/services/apexrest/Interactions');
        request.setMethod('POST');
        //request.setHeader('Authorization','Bearer'+ UserInfo.getSessionId());
        //request.setHeader('Authorization', 'OAuth' + UserInfo.getSessionId());

        /*String username = 'ralsadi2004@curious-koala-9bwqd0.com';
        String password = 'Onzaga4141';
     
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' +
        EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);*/

        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{ "firstName" : "Robert ","lastName" : "Clackson","address" : "calle Onzaguna","email" : "asdfasdfa@gmail.com"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() != 201) {
          
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus() + '//(2)' + UserInfo.getSessionId());
        } else {
            System.debug(response.getStatusCode());
            System.debug(response.getBody());
            
        }
       // return response.getStatusCode();
       return Url.getOrgDomainUrl().toExternalForm() + '/services/apexrest/Interactions/';
    }   


}