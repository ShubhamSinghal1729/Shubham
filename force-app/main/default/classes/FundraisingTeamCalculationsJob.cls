public class FundraisingTeamCalculationsJob implements Schedulable {
   public void execute(SchedulableContext sc) {
      FundraisingTeamBatch b = new FundraisingTeamBatch(); 
      Database.executeBatch(b,10);
   }
}