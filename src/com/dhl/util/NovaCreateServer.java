package com.dhl.util;

import com.woorea.openstack.base.client.OpenStackSimpleTokenProvider;
import com.woorea.openstack.examples.ExamplesConfiguration;
import com.woorea.openstack.keystone.Keystone;
import com.woorea.openstack.keystone.model.Access;
import com.woorea.openstack.nova.Nova;
import com.woorea.openstack.nova.model.Flavors;
import com.woorea.openstack.nova.model.Images;
import com.woorea.openstack.nova.model.KeyPairs;
import com.woorea.openstack.nova.model.Server;
import com.woorea.openstack.nova.model.ServerForCreate;

public class NovaCreateServer {

public static final String KEYSTONE_AUTH_URL = "http://192.168.2.41:35357/v2.0";
	
	public static final String KEYSTONE_USERNAME = "admin";
	
	public static final String KEYSTONE_PASSWORD = "000000";
	
	public static final String KEYSTONE_ENDPOINT = "http://192.168.2.41:35357/v2.0";
	
	public static final String TENANT_NAME = "admin";

	public static final String NOVA_ENDPOINT = "http://192.168.2.41:8774/v2";
	
	public static final String CEILOMETER_ENDPOINT = "";
	
  /**
   * @param args
   */
  public static void main(String[] args) {
		Keystone keystone = new Keystone(
				KEYSTONE_AUTH_URL);
		Access access = keystone
				.tokens()
				.authenticate()
				.withUsernamePassword(KEYSTONE_USERNAME,
						KEYSTONE_PASSWORD).execute();

		// use the token in the following requests
		keystone.token(access.getToken().getId());

		Nova nova = new Nova(NOVA_ENDPOINT.concat("/")
				.concat(access.getToken().getTenant().getId()));

		nova.token(access.getToken().getId());
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		KeyPairs keysPairs = nova.keyPairs().list().execute();
		Images images = nova.images().list(true).execute();
		Flavors flavors = nova.flavors().list(true).execute();

		ServerForCreate serverForCreate = new ServerForCreate();
		serverForCreate.setName("mooc-" + System.currentTimeMillis());
		serverForCreate.setFlavorRef(flavors.getList().get(0).getId());
		serverForCreate.setImageRef(images.getList().get(1).getId());
		serverForCreate.setKeyName(keysPairs.getList().get(0).getName());
		serverForCreate.getSecurityGroups().add(
				new ServerForCreate.SecurityGroup("default"));

		Server server = nova.servers().boot(serverForCreate).execute();
		System.out.println(server);

  }

}
