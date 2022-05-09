public class SiteDetailExtension {
    private static final String NO_USER_MSG = 'No users assigned to this site.';
    private static final String COMMMA_SEPARATOR = ',';
    public List<SiteElementWrapper> all_sites_list{get; set;}
    
    private Class SiteElementWrapper {
        public String site_name{get;set;}
        public String all_users{get;set;}
    }
    
    public SiteDetailExtension() {
        List<Site__c> site_elements = [SELECT Name, (SELECT Person__r.Name FROM Site_Assignments__r) FROM Site__c];
        all_sites_list = new List<SiteElementWrapper>();
        for (Site__c site : site_elements) {
            if (site.Site_Assignments__r == null) {
                all_sites_list.add(buildElement(site.Name, NO_USER_MSG));
            }
            else {
                List<Site_Assignment__c> site_assignments = site.Site_Assignments__r;
                List<String> names_to_join = new List<String>();
                for (Site_Assignment__c assignment : site_assignments) {
                    if (assignment.Person__r != null)
                        names_to_join.add(assignment.Person__r.Name);
                }
                all_sites_list.add(buildElementWithNameList(site.Name, names_to_join));
            }
        }
    }
    
    private SiteElementWrapper buildElementWithNameList(String site_name, List<String> names) {
        SiteElementWrapper element = new SiteElementWrapper();
        if (names.size() == 0)
            return buildElement(site_name, NO_USER_MSG);
        else if (names.size() == 1)
            return buildElement(site_name, names.get(0));
        else
            return buildElement(site_name, String.join(names, COMMMA_SEPARATOR));
    }
    
    private SiteElementWrapper buildElement(String name, String concat_users) {
        SiteElementWrapper element = new SiteElementWrapper();
        element.site_name = name;
        element.all_users = concat_users;
        return element;
    }
}