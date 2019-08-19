# ----------------------------------------------------------------------------
#  Copyright (c) 2018 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# ----------------------------------------------------------------------------

# Claas ei_integrator::params
# This class includes all the necessary parameters.
class ei_integrator::params inherits ei_common::params {
  $user_home = '/home/$user'
  $hostname = 'EI_ALB_DNS_NAME'
  $mgt_hostname = 'EI_ALB_DNS_NAME'
  $jdk_version = 'JDK_TYPE'
  $aws_access_key = 'ACCESS_KEY'
  $aws_secret_key = 'SECRET_KEY'
  $aws_region = 'REGION_NAME'
  $local_member_host = 'LOCAL-MEMBER-HOST'
  $http_proxy_port = '80'
  $https_proxy_port = '443'
  $profile = 'integrator'
  $service_name = "${product}-${profile}"
  $ei_analytics = 'localhost'
  $mediation_flow_statistics = 'false'
  $broker_elb_dns_name = 'localhost'
  $ei_package = '${product}-${product_version}.zip'
  $carbon_home="/var/lib/jenkins/workspace/EI-${product_version}/${module_name}"
  $start_script_template="bin/integrator.sh"
  $mysql_connector="mysql-connector-java-5.1.41-bin.jar"
  $puppet_modules_path ="/var/lib/jenkins/workspace/EI-${product_version}/configs/modules"

  $template_list = [
    'conf/datasources/master-datasources.xml',
    'conf/carbon.xml',
    'conf/axis2/axis2.xml',
    'conf/user-mgt.xml',
    'conf/registry.xml',
    'conf/tomcat/catalina-server.xml',
    'conf/synapse.properties',
    'conf/jndi.properties',
    'repository/deployment/server/eventpublishers/MessageFlowConfigurationPublisher.xml',
    'repository/deployment/server/eventpublishers/MessageFlowStatisticsPublisher.xml',
  ]

  #### ------ Configuration Params ------ ####

  # master-datasources.xml

  $reg_db_url = 'jdbc:mysql://EI_RDS_DNS_NAME:3306/WSO2EI_INTEGRATOR_CONFIG_GOV_DB?autoReconnect=true&amp;useSSL=false'
  $reg_db_username = 'CF_DB_USERNAME'
  $reg_db_password = 'CF_DB_PASSWORD'

  $user_db_url = 'jdbc:mysql://EI_RDS_DNS_NAME:3306/WSO2EI_USER_DB?autoReconnect=true&amp;useSSL=false'
  $user_db_username = 'CF_DB_USERNAME'
  $user_db_password = 'CF_DB_PASSWORD'

  # carbon.xml
  $security_keystore_location = '${carbon.home}/repository/resources/security/wso2carbon.jks'
  $security_keystore_type = 'JKS'
  $security_keystore_password = 'wso2carbon'
  $security_keystore_key_alias = 'wso2carbon'
  $security_keystore_key_password = 'wso2carbon'

  $security_trust_store_location = '${carbon.home}/repository/resources/security/client-truststore.jks'
  $security_trust_store_type = 'JKS'
  $security_trust_store_password = 'wso2carbon'

  # axis2.xml
  $transport_receiver_keystore_location = 'repository/resources/security/wso2carbon.jks'
  $transport_receiver_keystore_type = 'JKS'
  $transport_receiver_keystore_password = 'wso2carbon'
  $transport_receiver_keystore_key_password = 'wso2carbon'

  $transport_receiver_trust_store_location = 'repository/resources/security/client-truststore.jks'
  $transport_receiver_trust_store_type = 'JKS'
  $transport_receiver_trust_store_password = 'wso2carbon'

  $transport_sender_keystore_location = 'repository/resources/security/wso2carbon.jks'
  $transport_sender_keystore_type = 'JKS'
  $transport_sender_keystore_password = 'wso2carbon'
  $transport_sender_keystore_key_password = 'wso2carbon'

  $transport_sender_trust_store_location = 'repository/resources/security/client-truststore.jks'
  $transport_sender_trust_store_type = 'JKS'
  $transport_sender_trust_store_password = 'wso2carbon'

  # user-mgt.xml
  $admin_username = 'admin'
  $admin_password = 'admin'


  ####### ANALYTICS WORKER #########
    # Define the start script
    $analytics_start_script_template = 'wso2/analytics/wso2/worker/bin/carbon.sh'

    # Define the template
    $analytics_template_list = [
      'wso2/analytics/conf/worker/deployment.yaml'
    ]

      # -------------- Deployment.yaml Config -------------- #

      # Carbon Configuration Parameters
      $ports_offset = 0

      # transport.http config
      $default_listener_host = '0.0.0.0'
      $msf4j_host = '0.0.0.0'
      $msf4j_listener_keystore = '${carbon.home}/resources/security/wso2carbon.jks'
      $msf4j_listener_keystore_password = 'wso2carbon'
      $msf4j_listener_keystore_cert_pass = 'wso2carbon'

      # siddhi.stores.query.api config
      $siddhi_default_listener_host = '0.0.0.0'
      $siddhi_msf4j_host = '0.0.0.0'
      $siddhi_msf4j_listener_keystore = '${carbon.home}/resources/security/wso2carbon.jks'
      $siddhi_msf4j_listener_keystore_password = 'wso2carbon'
      $siddhi_msf4j_listener_keystore_cert_pass = 'wso2carbon'

  ####### ANALYTICS DASHBOARD #######

    # Define the template
    $dashboard_start_script_template = 'wso2/analytics/wso2/dashboard/bin/carbon.sh'

    # Define the template
    $dashboard_template_list = [
      'wso2/analytics/conf/dashboard/deployment.yaml'
    ]

      # -------------- Deployment.yaml Config -------------- #

      # Carbon Configuration Parameters
      $ports_offset = 2

      # Data Sources Configuration
      $business_rules_db_url = 'jdbc:mysql://EI_RDS_DNS_NAME:3306/BUSINESS_RULES_DB;DB_CLOSE_ON_EXIT=FALSE;LOCK_TIMEOUT=60000;MVCC=TRUE'
      $business_rules_db_username = 'CF_DB_USERNAME'
      $business_rules_db_password = 'CF_DB_PASSWORD'
      $business_rules_db_driver = 'org.h2.Driver'

      $status_dashboard_db_url = 'jdbc:mysql://EI_RDS_DNS_NAME:3306/wso2_status_dashboard;DB_CLOSE_ON_EXIT=FALSE;LOCK_TIMEOUT=60000;MVCC=TRUE'
      $status_dashboard_db_username = 'CF_DB_USERNAME'
      $status_dashboard_db_password = 'CF_DB_PASSWORD'
      $status_dashboard_db_driver = 'org.h2.Driver'

      # wso2.business.rules.manager config
      $business_rules_manager_username = 'admin'
      $business_rules_manager_password = 'admin'

      # wso2.status.dashboard config
      $status_dashboard_username = 'admin'
      $status_dashboard_password = 'admin'

      # transport.http configuration
      $default_host = '0.0.0.0'
      $default_listener_keystore = '${carbon.home}/resources/security/wso2carbon.jks'
      $default_listener_keystore_password = 'wso2carbon'
      $default_listener_keystore_cert_pass = 'wso2carbon'

        #### -------------- Deployment.yaml Config - Common -------------- ####

        # Configuration used for the databridge communication
        $databridge_keystore = '${carbon.home}/resources/security/wso2carbon.jks'
        $databridge_keystore_password = 'wso2carbon'
        $binary_data_receiver_hostname = '0.0.0.0'

        # Configuration of the Data Agents - to publish events through
        $thrift_agent_trust_store = '${carbon.home}/resources/security/client-truststore.jks'
        $thrift_agent_trust_store_password = 'wso2carbon'
        $binary_agent_trust_store = '${carbon.home}/resources/security/client-truststore.jks'
        $binary_agent_trust_store_password = 'wso2carbon'

        # Secure Vault Configuration
        $securevault_key_store = '${carbon.home}/resources/security/securevault.jks'
        $securevault_private_key_alias = 'wso2carbon'
        $securevault_secret_properties_file = '${carbon.home}/conf/${wso2.runtime}/secrets.properties'
        $securevault_master_key_reader_file = '${carbon.home}/conf/${wso2.runtime}/master-keys.yaml'

        # Data Sources Configuration
        $metrics_db_url = 'jdbc:mysql://EI_RDS_DNS_NAME:3306/metrics;AUTO_SERVER=TRUE'
        $metrics_db_username = 'CF_DB_USERNAME'
        $metrics_db_password = 'CF_DB_PASSWORD'
        $metrics_db_driver = 'org.h2.Driver'

        $permission_db_url = 'jdbc:mysql://EI_RDS_DNS_NAME:3306/PERMISSION_DB;IFEXISTS=TRUE;DB_CLOSE_ON_EXIT=FALSE;LOCK_TIMEOUT=60000;MVCC=TRUE'
        $permission_db_username = 'CF_DB_USERNAME'
        $permission_db_password = 'CF_DB_PASSWORD'
        $permission_db_driver = 'org.h2.Driver'

        $ei_analytics_db_url = 'jdbc:mysql://EI_RDS_DNS_NAME:3306/EI_ANALYTICS;AUTO_SERVER=TRUE'
        $ei_analytics_db_username = 'CF_DB_USERNAME'
        $ei_analytics_db_password = 'CF_DB_PASSWORD'
        $ei_analytics_db_driver = 'org.h2.Driver'
}
