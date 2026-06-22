@isTest 
public class AccountProcessorTest {    
    @isTest
    private static void countsContactsTest()
    {
       //load Test Data
       List<Account> accounts = new List<Account>();
       for (Integer i=0;i<200;i++) {
       		accounts.add(new Account(Name='AccountNamex'+i));
        }
    	insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        for (Account acc: accounts)
        {
            contacts.add(new Contact(FirstName=acc.Name, LastName='TestContact', accountid = acc.id));
            accountIds.add(acc.Id);
        }
        insert contacts;
        
        // do the test
        Test.startTest();
            AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        //check result;
        list<Account> accs = [Select id, Number_Of_Contacts__c from Account];
        for (Account acc:accs)
        {
            System.assertEquals(1, acc.Number_Of_Contacts__c, 'Error at least 1 Account record with incorrect number of contacts');
        }
    }
    
}