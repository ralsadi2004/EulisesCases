public class ContactAndLeadSearch {
    
    public static List<List< SObject>>searchContactsAndLeads(String Word)
    {
        List<List<sObject>> searchList = [FIND :Word IN ALL FIELDS 
            RETURNING Lead(FirstName,LastName), Contact(FirstName,LastName)];
        return searchList;
    }
}