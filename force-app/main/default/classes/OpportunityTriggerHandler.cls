public class OpportunityTriggerHandler {
  /*  
    public void OpportunityPeriod(List<Opportunity> listofOpportunity){
        List<Opportunity_Period__c> listofOpportunityPeriod = new List<Opportunity_Period__c>();
        
        for(Opportunity opp : listofOpportunity){
            Integer totalDays = CalculateTotalDays(opp.Start_Date__c,opp.End_Date__c);
            Integer workingDays = CalculateWorkingDays(opp.Start_Date__c,totalDays);
            Date assignmentStartDate = opp.Start_Date__c;
            Integer assignmentStartYear = assignmentStartDate.Year();
            Integer assignmentStartMonth = assignmentStartDate.Month();
            Date assignmentEndDate = opp.End_Date__c;
            Integer assignmentEndYear = assignmentEndDate.year();
            Integer assignmentEndMonth = assignmentEndDate.month();
            Integer totalrecords = assignmentEndMonth - assignmentStartMonth + 1 + (assignmentEndYear - assignmentStartYear)*12;            
            System.debug('@@@@@@@workingDays'+workingDays);
            for(Integer i = 0 ; i < totalrecords ; i++){
                Opportunity_Period__c opportunityPeriod = new Opportunity_Period__c();
                Integer month = assignmentStartMonth + i;
                Integer year = assignmentStartYear;
                if(month > 12){
                    year = assignmentStartYear + month/12;
                    month = Math.mod(month,12);
                    
                }
                Date startdate = Date.newInstance(year, month, 1);
                if(startdate < assignmentStartDate){
                    startdate = assignmentStartDate;
                }
                Date enddate = Date.newInstance(year, month, Date.daysInMonth(year, month));
                if(enddate > assignmentEndDate){
                    endDate = assignmentEndDate;
                }
                System.debug('@@@@@@@startdate'+startdate+'@@@@@@endDate');
                opportunityPeriod.Start_Date__c = startdate;
                opportunityPeriod.End_Date__c = endDate;
                opportunityPeriod.Opportunity__c = opp.Id;
                Integer daysbetween = CalculateTotalDays(startdate,endDate);
                System.debug('@@@@@@@@daysbetween'+daysbetween);
                Integer workingdaysbetween = CalculateWorkingDays(startdate,daysbetween);
                System.debug('@@@@@@@@workingdaysbetween'+workingdaysbetween);
                Decimal amount = opp.Amount;
                opportunityPeriod.Projected_Revenue__c = (amount/workingDays)*workingdaysbetween;
                opportunityPeriod.Straight_line_Revenue__c = (amount/workingDays)*workingdaysbetween;
                listofOpportunityPeriod.add(opportunityPeriod);
            }                     
        }
        insert listofOpportunityPeriod;
    }
    private Integer CalculateWorkingDays(Date StartDate, Integer totalDays){
        Datetime assignmentStartDateformat =  Datetime.newInstance(StartDate.year(), StartDate.month(), StartDate.day());
        String assignmentStartDay = assignmentStartDateformat.format('EEEE');
        System.debug('@@@@@assignmentStartDay'+assignmentStartDay+'@@@@@@'+Math.Mod(totalDays,7));
        Integer workingDays = (totalDays/7)*5;
        System.debug('@@@@@workingDays'+workingDays);
        if(Math.Mod(totalDays,7) == 6){
            if(assignmentStartDay == 'Monday' || assignmentStartDay == 'Sunday'){
                workingDays = workingDays + 5;  
            }
            else{
                workingDays = workingDays + 4; 
            }
        }else if(Math.Mod(totalDays,7) == 5){
            if(assignmentStartDay == 'Monday'){
                workingDays = workingDays + 5; 
            }else if(assignmentStartDay == 'Sunday' || assignmentStartDay == 'Tuesday'){
                workingDays = workingDays + 4;
            }else{
                workingDays = workingDays + 3;
            }
        }else if(Math.Mod(totalDays,7) == 4){
            if(assignmentStartDay == 'Monday' || assignmentStartDay == 'Tuesday'){
                workingDays = workingDays + 4; 
            }else if(assignmentStartDay == 'Sunday' || assignmentStartDay == 'Wenesday'){
                workingDays = workingDays + 3; 
            }else{
                workingDays = workingDays + 2; 
            }
        }else if(Math.Mod(totalDays,7) == 3){
            if(assignmentStartDay == 'Monday' || assignmentStartDay == 'Tuesday' || assignmentStartDay == 'Wenesday'){
                workingDays = workingDays + 3; 
            }else if(assignmentStartDay == 'Sunday' || assignmentStartDay == 'Thursday'){
                workingDays = workingDays + 2; 
            }else{
                workingDays = workingDays + 1; 
            }
        }else if(Math.Mod(totalDays,7) == 2){
            if(assignmentStartDay == 'Monday' || assignmentStartDay == 'Tuesday' || assignmentStartDay == 'Wenesday' || assignmentStartDay == 'Thrusday'){
                workingDays = workingDays + 2; 
            }else if(assignmentStartDay == 'Sunday' || assignmentStartDay == 'Friday'){
                workingDays = workingDays + 1; 
            }
        }else if(Math.Mod(totalDays,7) == 1){
            if(!(assignmentStartDay == 'Sunday' || assignmentStartDay == 'Saturday')){
                workingDays = workingDays + 1;
            }
        }
        return workingDays;
    }
    private Integer CalculateTotalDays(Date StartDate, Date Enddate){
        return StartDate.daysBetween(Enddate) + 1;
    }
    */
}