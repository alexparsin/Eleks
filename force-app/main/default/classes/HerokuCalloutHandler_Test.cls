@isTest
public class HerokuCalloutHandler_Test {
    @isTest static void testAuthentication(){
        Test.setMock(HttpCalloutMock.class, new HerokuAPIMock());
        HttpResponse res = HerokuCalloutHandler.authenticate();
        System.debug(res);
    }
}