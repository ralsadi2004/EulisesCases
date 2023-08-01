public with sharing class AccountController {
    //We annotate the method with @AuraEnabled(cacheable=true) so that the results are cached.
    @AuraEnabled(cacheable=true)
    //We define the getAccounts method in Apex, to perform a read operation and retrieve existing accounts.
    public static List<Account> getAccounts() {
        return [
            SELECT Name, AnnualRevenue, Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];

        
    }
}