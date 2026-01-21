@IsTest
private class BankCoreClientTest {
    @IsTest
    static void testPing_success() {
        Test.setMock(HttpCalloutMock.class, new BankCorePingMock());

        Test.startTest();
        BankCoreClient.ServiceRequestResponse resp = BankCoreClient.ping();
        Test.stopTest();

        System.assertNotEquals(null, resp, 'Response should not be null');
        System.assertEquals(true, resp.success, 'Ping should return success=true');
        System.assert(resp.message != null && resp.message.contains('HTTP 200'),
            'Message should include HTTP 200');
    }
}