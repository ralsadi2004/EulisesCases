public with sharing class ContactManager {
    
@AuraEnabled(cacheable = true)
public static List<Contact> getContact( String  email){

return [select id, LastName, Phone from Contact where email = :email];

}
 

} 