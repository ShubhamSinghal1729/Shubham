@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        Double x = 1.0;
        Double y = 2.0;
        String[] result = ParkLocator.country('India');
        // Verify that a fake result is returned
    }
    
}