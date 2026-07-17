public without sharing class CaseRetrievalController {

    @InvocableMethod(
        label='Get Customer Cases'
        description='Retrieve customer cases using email'
    )
    public static List<CaseResponse> getCases(List<CaseRequest> requests) {

        String customerEmail = requests[0].email;

        List<CaseResponse> responses = new List<CaseResponse>();

        CaseResponse response = new CaseResponse();

        response.caseOptions = new CustomerCases();
        response.caseOptions.cases = new List<CaseWrapper>();

        for(Case c : [
            SELECT
                Id,
                CaseNumber,
                Subject,
                Status,
                Priority,
                Description,
                CreatedDate
            FROM Case
            WHERE Contact.Email = :customerEmail
            ORDER BY CreatedDate DESC
            LIMIT 50
        ]){

            response.caseOptions.cases.add(
                new CaseWrapper(
                    c.CaseNumber,
                    c.Subject,
                    c.Status,
                    c.Priority,
                    c.Description,
                    c.CreatedDate
                )
            );
        }

        responses.add(response);

        return responses;
    }

    public class CaseRequest {

        @InvocableVariable(required=true)
        public String email;
    }

    public class CaseResponse {

        @InvocableVariable
        public CustomerCases caseOptions;
    }

    public class CustomerCases {

        public List<CaseWrapper> cases;
    }

    public class CaseWrapper {

        @InvocableVariable
        public String caseNumber;

        @InvocableVariable
        public String subject;

        @InvocableVariable
        public String status;

        @InvocableVariable
        public String priority;

        @InvocableVariable
        public String description;

        @InvocableVariable
        public Datetime createdDate;

        public CaseWrapper(
            String caseNumber,
            String subject,
            String status,
            String priority,
            String description,
            Datetime createdDate
        ){
            this.caseNumber = caseNumber;
            this.subject = subject;
            this.status = status;
            this.priority = priority;
            this.description = description;
            this.createdDate = createdDate;
        }
    }
}