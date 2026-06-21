public class AccountProcessor {
	@future
    public static void countContacts(List<Id> recordIds) {
        //List<Account> accounts = [Select Id, Name from Account Where Id IN :recordIds];
        List<Account> accounts= [Select Id, (Select id from Contacts) from Account Where Id IN :recordIds];
        for (Account acc : accounts)
        {
            //List<Contact> contacts = [Select id, name from Contact where AccountId = :acc.id];
            //acc.Number_Of_Contacts__c = contacts.size();
            acc.Number_Of_Contacts__c = acc.Contacts.size();
            System.debug(acc.Number_Of_Contacts__c);
            System.debug('some text 30Aug CRMCOM-304');
        }
        update accounts;
}
}