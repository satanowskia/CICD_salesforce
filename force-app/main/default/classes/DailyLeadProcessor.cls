global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, Name
            FROM Lead
            WHERE LeadSource  = '' limit 200];
        // Create a task for each opportunity in the list
        for (Lead lead : leads)
        {
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
      
    }

}