public with sharing class HDFCCustomerPortalController {

    @AuraEnabled(cacheable=true)
    public static DashboardWrapper getCustomerDashboard(
        String email
    ){

        DashboardWrapper wrapper =
            new DashboardWrapper();

        if(String.isBlank(email)){
            return wrapper;
        }

        Contact customerContact;

        List<Contact> contacts = [

            SELECT Id,
                   FirstName,
                   LastName,
                   Email

            FROM Contact

            WHERE Email = :email

            LIMIT 1
        ];

        if(!contacts.isEmpty()){

            customerContact = contacts[0];

            wrapper.customerName =
                customerContact.FirstName +
                ' ' +
                customerContact.LastName;

            wrapper.email =
                customerContact.Email;

            wrapper.contactId =
                customerContact.Id;

            wrapper.caseWrappers =
                new List<CaseWrapper>();

            List<Case> customerCases = [

                SELECT Id,
                       CaseNumber,
                       Subject,
                       Status,
                       Priority,
                       Description,
                       CreatedDate

                FROM Case

                WHERE ContactId =
                      :customerContact.Id

                ORDER BY CreatedDate DESC
            ];

            for(Case c : customerCases){

                CaseWrapper cw =
                    new CaseWrapper();

                cw.caseId = c.Id;
                cw.caseNumber = c.CaseNumber;
                cw.subject = c.Subject;
                cw.status = c.Status;
                cw.priority = c.Priority;
                cw.description = c.Description;

                cw.createdDate =
                    c.CreatedDate.format(
                        'dd MMM yyyy'
                    );

                wrapper.caseWrappers.add(cw);
            }
        }

        return wrapper;
    }

    public class DashboardWrapper{

        @AuraEnabled
        public String customerName;

        @AuraEnabled
        public String email;

        @AuraEnabled
        public Id contactId;

        @AuraEnabled
        public List<CaseWrapper> caseWrappers;
    }

    public class CaseWrapper{

        @AuraEnabled
        public Id caseId;

        @AuraEnabled
        public String caseNumber;

        @AuraEnabled
        public String subject;

        @AuraEnabled
        public String status;

        @AuraEnabled
        public String priority;

        @AuraEnabled
        public String description;

        @AuraEnabled
        public String createdDate;
    }
}