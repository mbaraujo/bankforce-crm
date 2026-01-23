public with sharing class BankCorePingController {
    @AuraEnabled(cacheable=false)
    public static String ping() {
        BankCoreClient.ServiceRequestResponse resp = BankCoreClient.ping();
        System.debug('CI gate test - remove me');
        return (resp != null) ? resp.message : 'No response';
    }
}