public class SiteDetailController {
    private static final String NO_USER_MSG = 'No users assigned to this site.';
    private static final String COMMMA_SEPARATOR = ',';
    public List<SiteElementWrapper> all_sites_list{get; set;}
    
    private Class SiteElementWrapper {
        public String site_name{get;set;}
        public String site_id{get;set;}
        public String all_users{get;set;}
        public Integer num_employee{get;set;}
    }
    
    public SiteDetailController() {
        List<Site__c> site_elements = [SELECT Name, (SELECT Person__r.Name FROM Site_Assignments__r) FROM Site__c];
        all_sites_list = new List<SiteElementWrapper>();
        for (Site__c site : site_elements) {
            if (site.Site_Assignments__r == null) {
                all_sites_list.add(buildElement(site, NO_USER_MSG, 0));
            }
            else {
                List<Site_Assignment__c> site_assignments = site.Site_Assignments__r;
                List<String> names_to_join = new List<String>();
                for (Site_Assignment__c assignment : site_assignments) {
                    if (assignment.Person__r != null)
                        names_to_join.add(assignment.Person__r.Name);
                }
                all_sites_list.add(buildElementWithNameList(site, names_to_join));
            }
        }
    }
    
    private SiteElementWrapper buildElementWithNameList(Site__c site, List<String> names) {
        SiteElementWrapper element = new SiteElementWrapper();
        if (names.size() == 0)
            return buildElement(site, NO_USER_MSG, names.size());
        else if (names.size() == 1)
            return buildElement(site, names.get(0), names.size());
        else
            return buildElement(site, String.join(names, COMMMA_SEPARATOR), names.size());
    }
    
    private SiteElementWrapper buildElement(Site__c site, String concat_users, Integer num) {
        SiteElementWrapper element = new SiteElementWrapper();
        element.site_name = site.Name;
        element.site_id = site.Id;
        element.all_users = concat_users;
        element.num_employee = num;
        return element;
    }
}