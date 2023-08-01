@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {  
     @HttpGet
    global static Account getAccount() {
        
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
       // String accountId = request.requestURI.substring(
         // request.requestURI.lastIndexOf('/')+1);
           String accId = request.requestURI.substringBetween('Accounts/', '/contacts');
       // Account result =  [SELECT Id, Name FROM Account WHERE Id = '0013t00001aFtXxAAK'];
        Account result =  [SELECT Id, Name, (SELECT Id, Name  FROM Contacts) FROM Account WHERE Id = :accId ];
        return result;
        
    } 
}