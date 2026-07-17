public without sharing class HDFCCaseCreationController {

    @InvocableMethod(label='Create HDFC Case')
    public static List<CaseCreationResponse> createCase(
        List<CaseCreationRequest> requests
    ){

        List<CaseCreationResponse> responses = new List<CaseCreationResponse>();

        Group hdfcQueue = [
            SELECT Id
            FROM Group
            WHERE Type = 'Queue'
            AND DeveloperName = 'HDFC_Cases'
            LIMIT 1
        ];

        Set<String> emails = new Set<String>();

        for(CaseCreationRequest req : requests){
            if(String.isNotBlank(req.email)){
                emails.add(req.email.toLowerCase());
            }
        }

        Map<String, Contact> contactMap = new Map<String, Contact>();

        for(Contact con : [
            SELECT Id, Email
            FROM Contact
            WHERE Email IN :emails
        ]){
            contactMap.put(con.Email.toLowerCase(), con);
        }

        Entitlement entitlementRec = [
            SELECT Id, Name
            FROM Entitlement
            WHERE Name = 'HDFC Entitlement'
            LIMIT 1
        ];

        for(CaseCreationRequest req : requests){

            Contact customerContact = contactMap.get(req.email.toLowerCase());

            Case c = new Case(
                Subject = req.caseDetails.subject,
                Priority = req.caseDetails.priority,
                Description = req.caseDetails.description,
                Origin = 'HDFC Agent',
                SuppliedEmail = req.email,
                ContactId = customerContact != null ? customerContact.Id : null,
                EntitlementId = entitlementRec.Id,
                OwnerId = hdfcQueue.Id
            );

            insert c;

            CaseCreationResponse res = new CaseCreationResponse();
            res.caseNumber = c.CaseNumber;
            res.caseId = c.Id;
            res.status = c.Status;

            responses.add(res);
        }

        return responses;
    }

    public class CaseCreationRequest{

        @InvocableVariable
        public CaseInput caseDetails;

        @InvocableVariable
        public String email;
    }

    public class CaseInput{

        @InvocableVariable
        public String subject;

        @InvocableVariable
        public String priority;

        @InvocableVariable
        public String description;
    }

    public class CaseCreationResponse{

        @InvocableVariable
        public Id caseId;

        @InvocableVariable
        public String caseNumber;

        @InvocableVariable
        public String status;
    }
}