@isTest
global class ParkServiceMock implements WebServiceMock {
     global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountry response_x = 
            new ParkService.byCountry();
        response_x.arg0 = 'Germany';
        // end
        response.put('response_x', response_x); 
   }

}