public class ContactSearch {
    
     public static List<Contact> searchForContacts(String lastName, String mailingPostal)
    {
         List<Contact> ctt =  [ SELECT ID, NAME FROM Contact where LastName =:lastName and  MailingPostalCode=:mailingPostal];
         return   ctt;  
    }

}