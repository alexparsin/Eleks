public interface HerokuSync_Interface {
    HttpResponse authenticate();
    HttpResponse syncRecords(List<sObject> records);
    HttpResponse searchRecords(String searchTerm);
}