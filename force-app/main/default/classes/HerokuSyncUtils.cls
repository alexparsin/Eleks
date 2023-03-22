public without sharing class HerokuSyncUtils {
    public virtual class HerokuSyncException extends Exception {}
    public class ConfigurationException extends HerokuSyncException {}

    public static HTTPRequest populateCredentials(){
        List<Heroku_Credential__mdt> cred = new List<Heroku_Credential__mdt>();
        cred = [SELECT Endpoint__c, Username__c, Password__c FROM Heroku_Credential__mdt];
        if(cred.size() == 0){
            // Log an error: credentials have not been configured in custom metadata
            throw new ConfigurationException('Credentials have not been configured in custom metadata');
        }
        if(cred.size() > 1){
            // Log an error: there should be only one credential configured in custom metadata
            throw new ConfigurationException('There should be only one credential configured in custom metadata');
        }
        HTTPRequest req = new HTTPRequest();
        req.setHeader('username', cred[0].Username__c);
        req.setHeader('password', cred[0].Password__c);
        req.setEndpoint(cred[0].Endpoint__c);
        return req;
    }

    public class HerokuResponseWrapper{
        String result;
        String access_token;
        List<String> errors;
        Map<String, List<sObject>> records;
    }
}