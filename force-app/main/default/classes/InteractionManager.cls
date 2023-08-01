@RestResource(urlMapping='/Interactions/*')
global with sharing class InteractionManager {

     @HttpPost
    global static ID createInteraction(String firstName, String lastName,
        String address, String email) {
            System.debug('Ingreso al WS');
        Interactions__c thisInteraction = new Interactions__c(
            First_Name__c = firstName,      
        	Last_Name__c = lastName,
            Address__c = address,
            Email__c = email        
        );
        insert thisInteraction;
        return thisInteraction.Id;
    }   
}