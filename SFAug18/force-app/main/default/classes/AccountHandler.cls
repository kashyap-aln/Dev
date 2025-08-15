public with sharing class AccountHandler {

    // Method to get all active Accounts
    public static List<Account> getActiveAccounts() {
        return [SELECT Id, Name, Industry, AnnualRevenue 
                FROM Account 
                WHERE IsActive__c = TRUE
                ORDER BY Name];
    }

    // Method to create a new Account
    public static Account createAccount(String name, String industry, Decimal revenue) {
        Account acc = new Account(
            Name = name,
            Industry = industry,
            AnnualRevenue = revenue,
            IsActive__c = TRUE
        );
        insert acc;
        return acc;
    }

    // Method to deactivate an account
    public static void deactivateAccount(Id accountId) {
        Account acc = [SELECT Id, IsActive__c FROM Account WHERE Id = :accountId LIMIT 1];
        acc.IsActive__c = FALSE;
        update acc;
    }
}