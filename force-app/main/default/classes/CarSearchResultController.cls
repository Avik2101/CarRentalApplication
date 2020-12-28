
public with sharing class CarSearchResultController {

    @AuraEnabled(Cacheable=true)
    public static List<Car__c> getCars(String carTypeId){
        if(String.isEmpty(carTypeId)){
            return [SELECT Available_For_Rent__c,Build_Year__c,Car_Type__c,Contact__c,Description__c,
                    Geolocation__Latitude__s,Geolocation__Longitude__s,Id,Mileage__c,Name,Per_Day_Rent__c,Picture__c
                    FROM Car__c WHERE Available_For_Rent__c=TRUE];
        }else {
            return[SELECT Available_For_Rent__c,Build_Year__c,Car_Type__c,Contact__c,Description__c,
                    Geolocation__Latitude__s,Geolocation__Longitude__s,Id,Mileage__c,Name,Per_Day_Rent__c,Picture__c
                    FROM Car__c WHERE Available_For_Rent__c=TRUE
                    AND Car_Type__c = :carTypeId];
        }
    }



}