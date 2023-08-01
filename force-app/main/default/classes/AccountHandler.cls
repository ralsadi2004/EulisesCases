public class AccountHandler {
    
	public static void insertAccount(Integer numRecords)
    {
        integer counter = 1;
        List<Account> addAccounts = new List<Account>();
        
        while(counter <= numRecords)
        {
            Account newAccount = new Account();
            newAccount.Name = 'Acme Inc' + counter;
            newAccount.AccountNumber = '35629' + counter;
            addAccounts.add(newAccount);
            System.debug(addAccounts);
            counter = counter + 1;
        }
        
        insert addAccounts;
    }
                                    
}