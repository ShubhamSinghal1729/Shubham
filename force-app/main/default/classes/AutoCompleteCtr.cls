global class AutoCompleteCtr

{

    public static List<String> leadNameList{get;set;}

    public String lName{get;set;}

    public String successMessage{get;set;}

    @RemoteAction

    global static String[] populateLeadByName(String value)

    {

        try

        {

            leadNameList=new List<String>();

            if(String.isNotBlank(value))

            {

                value= '%'+value+'%';

                List<Lead> lstLead=[Select Id,name from Lead where name LIKE:value];

                for(Lead l:lstLead)

                {

                    leadNameList.add(l.name);

                }

            }

            return leadNameList;

        }

        catch(Exception e)

        {

            System.debug('Message:='+e.getMessage()+'**Line Number='+e.getLineNumber());

        }

        return null;

    }

   

    public void updateLead()

    {

        try

        {

             lName=ApexPages.currentPage().getParameters().get('leadName');

            if(String.isNotBlank(lName))

            {

                Lead lead=[select id,name from Lead where Name=:lName];

              //  lead.Update_By__c='Autocomplete';

                update lead;

                successMessage='Lead Update Successfully';

            }

        }

        catch(Exception e)

        {

            System.debug('Message:='+e.getMessage()+'**Line Number='+e.getLineNumber());

        }

    }

}