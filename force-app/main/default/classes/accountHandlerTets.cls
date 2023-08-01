public class accountHandlerTets {
    
    public static Account insertNewAccount(String stringA)
    {
        Account acct = new Account(Name=stringA, Phone='(415)555-1212', NumberOfEmployees=100);
        // Insert the account by using DML
        insert acct;
        return acct;
    }

}