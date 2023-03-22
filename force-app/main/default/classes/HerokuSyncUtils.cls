public without sharing class HerokuSyncUtils {
    public virtual class HerokuSyncException extends Exception {}
    public class ConfigurationException extends HerokuSyncException {}

    public static HTTPRequest populateCredentials(){
        Profile adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        Heroku_Sync_Settings__c hss = Heroku_Sync_Settings__c.getInstance(adminProfile.Id);
        if(hss == null){
            // Log an error: credentials have not been configured in custom settings
            throw new ConfigurationException('Configuration not found in custom settings');
        }
        if(String.isBlank(hss.Username__c) || String.isBlank(hss.Password__c)){
            // Log an error: Username and Password should be populated in Custom Setting
            throw new ConfigurationException('The Username and Password should be populated in custom settings');
        }
        if(String.isBlank(hss.Encryption_Key_Heroku__c) || String.isBlank(hss.Encryption_Key_SF__c)){
            // Log an error: Encryption Keys should be populated in Custom Setting
            throw new ConfigurationException('The Encryption Keys should be populated in custom settings');
        }
        if(String.isBlank(hss.Init_Vector_Heroku__c) || String.isBlank(hss.Init_Vector_SF__c)){
            // Log an error: Encryption Keys should be populated in Custom Setting
            throw new ConfigurationException('The Init Vectors should be populated in custom settings');
        }
        HTTPRequest req = new HTTPRequest();
        req.setHeader('username', hss.Username__c);
        req.setHeader('password', hss.Password__c);
        req.setEndpoint(hss.Endpoint__c);
        return req;
    }

    public class HerokuResponseWrapper{
        String result;
        String access_token;
        List<String> errors;
        Map<String, List<sObject>> records;
    }
}