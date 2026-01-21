@IsTest
global class BankCorePingMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');

        System.assertEquals('GET', req.getMethod());
        System.assert(req.getEndpoint().contains('/ping'));

        res.setStatusCode(200);
        res.setBody('{"success":true,"message":"pong"}');
        return res;
    }
}