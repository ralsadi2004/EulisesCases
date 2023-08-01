public with sharing class ContactController {
     //We annotate the method with @AuraEnabled(cacheable=true) so that the results are cached.
     @AuraEnabled(cacheable=true)
     //We define the getAccounts method in Apex, to perform a read operation and retrieve existing accounts.
     public static List<Contact> getContacts() {
        return [
             SELECT FirstName, LastName, Email
             FROM Contact
             WITH SECURITY_ENFORCED
             ORDER BY Name
         ];
     
     }


     public static HttpResponse makePostCallout() {
          Http http = new Http();
          HttpRequest request = new HttpRequest();
          request.setEndpoint(Url.getOrgDomainUrl().toExternalForm() + '/services/apexrest/Interactions/');
          request.setMethod('POST');
          request.setHeader('Content-Type', 'application/json;charset=UTF-8');
          request.setBody('{ "firstName" : "Robert ","lastName" : "Clackson","address" : "calle Onzaguna","email" : "asdfasdfa@gmail.com"}');
          HttpResponse response = http.send(request);
          // Parse the JSON response
          if(response.getStatusCode() != 201) {
              System.debug('The status code returned was not expected: ' +
                  response.getStatusCode() + ' ' + response.getStatus());
          } else {
              System.debug(response.getBody());
          }
          return response;
      }   
}