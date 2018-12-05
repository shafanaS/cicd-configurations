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

# Class: ei_integrator
# Init class of EI Integrator default profile
class ei_integrator (
  $user = $ei_integrator::params::user,
  $user_id = $ei_integrator::params::user_id,
  $user_group = $ei_integrator::params::user_group,
  $user_group_id = $ei_integrator::params::user_group_id,
  $product = $ei_integrator::params::product,
  $product_version = $ei_integrator::params::product_version,
  $profile = $ei_integrator::params::profile,
  $service_name = $ei_integrator::params::service_name,
  $template_list = $ei_integrator::params::template_list,
  $start_script_template = $ei_integrator::params::start_script_template,

  # ------ Configuration Params ------ #

  # master-datasources.xml
  # $carbon_db_url = $ei_integrator::params::carbon_db_url,
  # $carbon_db_username = $ei_integrator::params::carbon_db_username,
  # $carbon_db_password = $ei_integrator::params::carbon_db_password,
  # $carbon_db_driver = $ei_integrator::params::carbon_db_driver,

  # carbon.xml
  $security_keystore_location = $ei_integrator::params::security_keystore_location,
  $security_keystore_type = $ei_integrator::params::security_keystore_type,
  $security_keystore_password = $ei_integrator::params::security_keystore_password,
  $security_keystore_key_alias = $ei_integrator::params::security_keystore_key_alias,
  $security_keystore_key_password = $ei_integrator::params::security_keystore_key_password,

  $security_trust_store_location = $ei_integrator::params::security_trust_store_location,
  $security_trust_store_type = $ei_integrator::params::security_trust_store_type,
  $security_trust_store_password = $ei_integrator::params::security_trust_store_password,

  # axis2.xml
  $transport_receiver_keystore_location = $ei_integrator::params::transport_receiver_keystore_location,
  $transport_receiver_keystore_type = $ei_integrator::params::transport_receiver_keystore_type,
  $transport_receiver_keystore_password = $ei_integrator::params::transport_receiver_keystore_password,
  $transport_receiver_keystore_key_password = $ei_integrator::params::transport_receiver_keystore_key_password,

  $transport_receiver_trust_store_location = $ei_integrator::params::transport_receiver_trust_store_location,
  $transport_receiver_trust_store_type = $ei_integrator::params::transport_receiver_trust_store_type,
  $transport_receiver_trust_store_password = $ei_integrator::params::transport_receiver_trust_store_password,

  $transport_sender_keystore_location = $ei_integrator::params::transport_sender_keystore_location,
  $transport_sender_keystore_type = $ei_integrator::params::transport_sender_keystore_type,
  $transport_sender_keystore_password = $ei_integrator::params::transport_sender_keystore_password,
  $transport_sender_keystore_key_password = $ei_integrator::params::transport_sender_keystore_key_password,

  $transport_sender_trust_store_location = $ei_integrator::params::transport_sender_trust_store_location,
  $transport_sender_trust_store_type = $ei_integrator::params::transport_sender_trust_store_type,
  $transport_sender_trust_store_password = $ei_integrator::params::transport_sender_trust_store_password,

  # $clustering_enabled = $ei_integrator::params::clustering_enabled,
  # $clustering_membership_scheme = $ei_integrator::params::clustering_membership_scheme,
  # $clustering_wka_members = $ei_integrator::params::clustering_wka_members,

  # user-mgt.xml
  $admin_username = $ei_integrator::params::admin_username,
  $admin_password = $ei_integrator::params::admin_password,
)

  inherits ei_integrator::params {

  # Copy configuration changes to the installed directory
  $template_list.each | String $template | {
    # file { "$wso2_path/$product-$product_version/${template}":
    file { "$wso2_path/${template}":
      ensure  => file,
      mode    => '0644',
      content => template("${module_name}/carbon-home/${template}.erb")
    }
  }

  # Copy wso2server.sh to installed directory
  # file { "$wso2_path/$product-$product_version/${start_script_template}":
    file { "$wso2_path/${start_script_template}":
    ensure  => file,
    mode    => '0754',
    content => template("${module_name}/carbon-home/${start_script_template}.erb")
  }

  # Copy mysql-connector-java-5.1.41-bin.jar to installed directory
  # file { "$wso2_path/$product-$product_version/lib/${mysql_connector}":
  file { "$wso2_path/lib/${mysql_connector}":
    mode   => '0754',
    source => "puppet:///modules/ei_integrator/mysql-connector-java-5.1.41-bin.jar",
  }
}
