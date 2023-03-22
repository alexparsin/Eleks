public class HerokuCalloutHandler  implements HerokuSync_Interface{
    public static HTTPResponse authenticate() {
        HTTPRequest req = HerokuSyncUtils.populateCredentials();
        HTTPResponse res = new HTTPResponse();
        return res;
    }

    public static HTTPResponse syncRecords(List<sObject> records){
        return new HTTPresponse();
    }
    
    public static HTTPResponse searchRecords(String searchTerm){
        return new HTTPresponse();
    }
}