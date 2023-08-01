public class StringArrayTest {
    
    public static Account insertNewAccount(String sAccountName)
    {
        try{
            Account acct = new Account(Name=sAccountName);
			insert acct;
            return	 acct;
        }catch(DmlException e)
        {
             System.debug('A DML exception has occurred: ' +
                e.getMessage());
			return null;         
        }
        
    }
}