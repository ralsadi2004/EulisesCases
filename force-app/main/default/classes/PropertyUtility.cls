public class PropertyUtility {
    
    public static void newListedProperties()
    {
     List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        
         for (Account con : accountsList){
            String acctRev = con.Name + ':' + con.AnnualRevenue;
            system.debug(acctRev);
        }
}
}