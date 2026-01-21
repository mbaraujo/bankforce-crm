public with sharing class BankCoreClient {
    public class ServiceRequestResponse {
        public Boolean success;
        public String externalTicketId;
        public String message;
    }

    public static ServiceRequestResponse ping() {
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('callout:BankCore/services/data/');
        req.setTimeout(120000);

        Http http = new Http();
        HttpResponse res = http.send(req);

        ServiceRequestResponse out = new ServiceRequestResponse();
        Integer code = res.getStatusCode();
        out.success = (code >= 200 && code < 300) || code == 302;
        out.message = 'HTTP ' + code + ' - ' + res.getBody();
        if (code == 302) {
            out.message = 'HTTP 302 - Redirect expected (no-auth). Connectivity OK.';
        }

        return out;
    }
}