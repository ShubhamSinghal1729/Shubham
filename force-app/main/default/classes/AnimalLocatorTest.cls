@isTest
public class AnimalLocatorTest{
@isTest
    private static void executegetAnimalNameById(){
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    AnimalLocator.getAnimalNameById(0); 
    }

}