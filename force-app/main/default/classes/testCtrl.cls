public with sharing class testCtrl {
    
    public void  test1(){                                   
                        String currentTime_Inv = System.Now().addMinutes(2).format('yyyy-MM-dd\'T\'HH:mm'); // Investor after 10 minutes of Authenication
                        String[] dateTime_Inv = currentTime_Inv.split('T');
                        String[] todate_Inv = dateTime_Inv[0].split('-');
                        String[] tominute_Inv = dateTime_Inv[1].split(':');                                            
                            String schCron_Investor = '0 '+tominute_Inv[1]+' '+tominute_Inv[0]+' '+todate_Inv[2]+' '+todate_Inv[1]+' ? ' +todate_Inv[0];                      
                            testScheduler sch_Fetch_inv = new testScheduler();
                            String jobId = System.schedule('Scheduler For Time Investor',schCron_Investor,sch_Fetch_inv);   
                         // testScheduler.scheduleInvestor();
    }
}