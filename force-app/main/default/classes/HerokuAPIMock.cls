global class HerokuAPIMock implements HerokuSync_Interface{
    public static HTTPResponse authenticate() {
        HTTPResponse res = new HTTPResponse();
        res.setStatus('success');
        res.setStatusCode(200);
        res.setBody('{"result" : "success", "errors" : [], "access_token" : "1234567890", "records" : {"synced_records": [], "error_records": []}}}');
        return res;
    }

    public static HTTPResponse syncRecords(List<sObject> records){
        return new HTTPresponse();
    }
    
    public static HTTPResponse searchRecords(String searchTerm){
        return new HTTPresponse();
    }
}