public with sharing class BankCorePingController {
    @AuraEnabled(cacheable=false)
    public static String ping() {
        BankCoreClient.ServiceRequestResponse resp = BankCoreClient.ping();
        return (resp != null) ? resp.message : 'No response';
    }
}