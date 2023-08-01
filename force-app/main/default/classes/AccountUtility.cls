public class AccountUtility {

    public static void viewAnnualRevenue()
    {
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        
         for (Account con : accountsList){
            String acctRev = con.Name + ':' + con.AnnualRevenue;
            system.debug(acctRev);
        }
    }
    
}