## Project 1 - Custom Salesforce Application for an apparel business
 
### Sales Cloud Features
  * Opportunity paths provide step by step guidance for sales cloud users.
  * Leads have assignment rules
    * First rule is for high priority leads with an annual revenue > $500,000 within US.
    * Assignment based on annual revenue > $500,000 for international.
    * Assignmentt rule based on if the lead is in US or not.
  * Custom pricebooks for buying apparel products from suppliers and selling apparel products to regular customers.

### Service Cloud Features
  * Case assignment and escalation rules have been set up
  * Case assignment rules
    * Based on priority of the case (High, Medium, Low) and if escalated
    * Based on apparel product
  * Case escalation rules
    *  Based on priority, if the case has been escalated, and potential liability of the case.
  * Case paths have been configured to offer step by step guidance for each step in the process.

### Security Features
  * For each custom profile, such as sales or support profile, object and field level security is set.
  * Sales users have access to the custom object "section", in order to generate reports for the particular section.
  * Service and support users do not have access to the custom object "section" as the revenue is not relevant to their day to day activities.

### UI Features
  * Added a custom application with a custom home page for managerial positions.
  * Home page displays generated revenue of each section in the apparel store.
  * Added quick action to split sections if restructuring of the sections is required.
  * Added UI component in section page for easy creation of new apparel sections and assignment of users to sections.

