@isTest
private class ParkLocatorTest {
    
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String x = 'Germany';
        String[] result = ParkLocator.country(x);
        String[] countryresult = new List<String>();
        countryresult.add('Germany');
        // Verify that a fake result is returned
        System.assertEquals(countryresult, result); 
    }

}