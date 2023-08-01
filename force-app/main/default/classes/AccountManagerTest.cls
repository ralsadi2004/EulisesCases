@IsTest
private class AccountManagerTest {
    @isTest static void testgetAccount() {
        //String recordId = '0013t00001aFtXxAAK';
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
          request.requestUri = 'https://na123.salesforce.com/services/apexrest/Accounts/'+ recordId +'/contacts' ;
        /*request.requestUri =
            'https://na123.salesforce.com/services/apexrest/Accounts/'
            + recordId;*/
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisCase = AccountManager.getAccount();
        // Verify results
        System.assert(thisCase != null);
        System.assertEquals('Test record', thisCase.Name);
    }
    
    // Helper method
        static Id createTestRecord() {
        // Create test record
        Account TestAcc = new Account(
          Name='Test record');
        insert TestAcc;
        Contact TestCon= new Contact(
        LastName='Test', 
        AccountId = TestAcc.id);
        return TestAcc.Id;
    }      
          
}