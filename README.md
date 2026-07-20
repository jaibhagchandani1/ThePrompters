# 🤖 The Prompters - AgentResQ

### AI-Powered Insurance Customer Support Assistant built using Salesforce Agentforce

AgentResQ is an intelligent virtual assistant developed for the Insurance domain using Salesforce Agentforce. It enables customers to interact through an Experience Cloud portal, resolve FAQs, create support cases, and seamlessly transfer conversations to live agents when required.

---

# 📑 Table of Contents

- Project Overview
- Problem Statement
- Business Scenario
- Proposed Solution
- Architecture
- Features
- Technology Stack
- Customer Journey
- Business Impact
- Challenges
- Repository Structure
- Installation
- Deployment
- Team Members

---

# 🚀 Project Overview

AgentResQ is an AI-powered customer support assistant built using Salesforce Agentforce for the insurance industry.

The solution demonstrates how Salesforce Agentforce can automate customer interactions through Experience Cloud while integrating with Salesforce Service Cloud to provide intelligent customer support.

The chatbot helps customers by:

- Answering insurance FAQs
- Creating Salesforce Cases
- Identifying customers
- Escalating chats to live agents
- Capturing CSAT
- Generating AI conversation summaries

---

# 🎯 Problem Statement

Insurance companies receive thousands of repetitive customer queries every day regarding:

- Policy information
- Claims
- Premium payments
- Required documents
- General FAQs
- Service Requests

Most of these requests can be handled automatically without human intervention.

The objective of AgentResQ is to automate these interactions while improving customer experience and reducing support costs.

---

# 🏢 Business Scenario

For demonstration purposes, the solution uses HDFC Life Insurance FAQs.

Customers can ask questions such as:

- How do I download my policy?
- How do I change my nominee?
- I forgot my MyAccount password.
- What are the benefits of Term Insurance?
- How do I view my policy online?

These FAQs are answered using Agentforce Data Library.

---

# 💡 Proposed Solution

AgentResQ uses Salesforce Agentforce together with multiple Salesforce products to deliver intelligent customer support.

The solution consists of:

- Salesforce Experience Cloud Portal
- Embedded Messaging
- Agentforce AI Agent
- Salesforce Service Cloud
- Agentforce Data Library
- Salesforce Data Cloud Search Index
- Salesforce Flows
- Apex
- Lightning Web Components

Knowledge articles are stored as PDF documents inside Agentforce Data Library and indexed using Data Cloud Search Index.

---

# 🏗 Solution Architecture

```text
Customer
     │
     ▼
Experience Cloud Portal
     │
Embedded Messaging
     │
     ▼
AgentResQ (Agentforce)
     │
 ┌──────────────┬────────────────┬─────────────────┐
 │              │                │
 ▼              ▼                ▼
Knowledge    Apex Actions     Salesforce Flow
Library
 │              │                │
 ▼              ▼                ▼
FAQ Search   Case Creation   Customer Identification
                    │
                    ▼
Messaging Session
                    │
                    ▼
Conversation Summary
                    │
                    ▼
CSAT Collection
                    │
                    ▼
Live Agent Escalation (If Required)
```

---

# ⭐ Features

- Intelligent FAQ Resolution
- Customer Login
- Embedded Messaging
- Customer Identification
- Knowledge Search
- Automated Case Creation
- Live Agent Transfer
- Messaging Session Tracking
- AI Conversation Summaries
- CSAT Collection
- Reports & Dashboards

---

# 👤 Customer Journey

1. Customer logs into Experience Cloud Portal.
2. Starts chatting with AgentResQ.
3. Agent identifies the customer.
4. Customer asks insurance-related questions.
5. Agent answers using Agentforce Knowledge.
6. Creates Salesforce Case if required.
7. Escalates to Live Agent when necessary.
8. Generates Conversation Summary.
9. Captures Customer Satisfaction (CSAT).

---

# ⚙ Technology Stack

- Salesforce Agentforce
- Salesforce Experience Cloud
- Salesforce Service Cloud
- Salesforce Data Cloud
- Lightning Web Components (LWC)
- Apex
- Salesforce Flow
- SOQL
- Embedded Messaging
- GitHub
- Salesforce CLI
- Visual Studio Code

---

# 📊 Business Impact

## Customer Benefits

- 24x7 Customer Support
- Instant Responses
- Faster Resolution
- Better Customer Experience
- Self-Service Portal

## Business Benefits

- Reduced Support Cost
- Lower Agent Workload
- Increased Productivity
- Better Customer Satisfaction
- Operational Visibility

## AI Benefits

- Consistent Responses
- Context-Aware Conversations
- Automated Summaries
- Scalable Customer Support

---

# ⚠ Challenges

- Unified Knowledge limitations
- Storage limitations
- Data Stream Sitemap crawler limitations
- Lightning Types availability

---

# 🔮 Future Enhancements

- Agentforce Voice
- Multilingual Support
- Lightning Types Integration
- Enhanced Customer Profiling
- Data Cloud Personalization

---

# 📁 Repository Structure

```
force-app/
│
├── classes/
├── lwc/
├── objects/
├── flows/
├── permissionsets/
├── applications/
├── layouts/
├── flexipages/
├── experiences/
├── staticresources/
│
config/
scripts/
README.md
sfdx-project.json
package.json
```

---

# 🛠 Installation

Clone the repository

```bash
git clone <repository-url>
```

Authorize Salesforce Org

```bash
sf org login web
```

Deploy Metadata

```bash
sf project deploy start
```

Open Org

```bash
sf org open
```

---

# 🚀 Deployment

Deploy the complete metadata using Salesforce CLI.

```bash
sf project deploy start
```

Retrieve metadata

```bash
sf project retrieve start
```

Run Apex Tests

```bash
sf apex run test
```

---

# 👨‍💻 Team Members

| Name | Role |
|------|------|
| Jai Bhagchandani
| Shaji 
| Theepan (TK) 
| Anshu Jha

---

# 🙏 Acknowledgements

Built using Salesforce Agentforce, Experience Cloud, Service Cloud, Data Cloud and Lightning Web Components.

Developed by **The Prompters**.