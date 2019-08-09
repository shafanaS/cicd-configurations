#----------------------------------------------------------------------------
#  Copyright (c) 2019 WSO2, Inc. http://www.wso2.org
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
#----------------------------------------------------------------------------

class ei_common::params {

  $user = 'wso2carbon'
  $user_group = 'wso2'
  $user_id = 802
  $user_group_id = 802
  $product = 'wso2ei'
  $product_version = '6.4.0'

  # Performance tuning configurations
  $enable_performance_tuning = false
  $performance_tuning_flie_list = [
    'etc/sysctl.conf',
    'etc/security/limits.conf',
  ]

  # ${carbon.home} = ${product}-${product-version}/${user_group}/analytics

  #### -------------- Deployment.yaml Config -------------- ####

  # Configuration used for the databridge communication
  $databridge_keystore = '${sys:carbon.home}/resources/security/wso2carbon.jks'
  $databridge_keystore_password = 'wso2carbon'
  $binary_data_receiver_hostname = '0.0.0.0'

  # Configuration of the Data Agents - to publish events through
  $thrift_agent_trust_store = '${sys:carbon.home}/resources/security/client-truststore.jks'
  $thrift_agent_trust_store_password = 'wso2carbon'
  $binary_agent_trust_store = '${sys:carbon.home}/resources/security/client-truststore.jks'
  $binary_agent_trust_store_password = 'wso2carbon'

  # Secure Vault Configuration
  $securevault_key_store = '${sys:carbon.home}/resources/security/securevault.jks'
  $securevault_private_key_alias = 'wso2carbon'
  $securevault_secret_properties_file = '${sys:carbon.home}/conf/${sys:wso2.runtime}/secrets.properties'
  $securevault_master_key_reader_file = '${sys:carbon.home}/conf/${sys:wso2.runtime}/master-keys.yaml'

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