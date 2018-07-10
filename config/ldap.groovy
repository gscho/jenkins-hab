import jenkins.security.plugins.ldap.*
import java.util.*
import java.lang.reflect.*
import jenkins.*
import jenkins.model.*
import hudson.*
import hudson.model.*
import hudson.security.*

def instance = Jenkins.getInstance()


if ("{{toLowercase cfg.admin.strategy}}" == "ldap") {
  def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
  strategy.setAllowAnonymousRead(false)
  instance.setAuthorizationStrategy(strategy)
  String server = "{{cfg.ldap.server}}"
  String rootDN = "{{cfg.ldap.rootDN}}"
  String userSearchBase = "{{cfg.ldap.userSearchBase}}"
  String userSearch = "{{cfg.ldap.userSearch}}"
  String groupSearchBase = "{{cfg.ldap.groupSearchBase}}"
  String managerDN = "{{cfg.ldap.managerDN}}"
  String passcode = "{{cfg.ldap.passcode}}"
  boolean inhibitInferRootDN = "{{cfg.ldap.inhibitInferRootDN}}"
  LDAPSecurityRealm ldapRealm = new LDAPSecurityRealm(server, rootDN, userSearchBase, userSearch, groupSearchBase, managerDN, passcode, inhibitInferRootDN)
  instance.setSecurityRealm(ldapRealm)
  instance.save()
}
