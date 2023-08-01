@istest
public class TestRestrictContactByName {
    
    @isTest static void TestRestrictContactByName(){
        
        
        Contact contact  =  new Contact(LastName='INVALIDNAME');
        Test.startTest();
         Database.SaveResult result = Database.insert(contact, false);
        insert contact;
        Test.stopTest();
        
         System.assert(!result.isSuccess());
         System.assert(result.getErrors().size() > 0);
         /*System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());*/
    }
        
 }