package com.dhl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CloudDao;
import com.dhl.dao.UserCloudDao;
import com.dhl.domain.Cloud;
import com.dhl.domain.UserCloud;
import com.dhl.util.Configuration;
import com.woorea.openstack.base.client.OpenStackSimpleTokenProvider;
import com.woorea.openstack.keystone.Keystone;
import com.woorea.openstack.keystone.model.Access;
import com.woorea.openstack.keystone.model.authentication.UsernamePassword;
import com.woorea.openstack.nova.Nova;
import com.woorea.openstack.nova.api.ServersResource;
import com.woorea.openstack.nova.model.Image;
import com.woorea.openstack.nova.model.Images;
import com.woorea.openstack.nova.model.Server;
import com.woorea.openstack.nova.model.Server.Addresses.Address;
import com.woorea.openstack.nova.model.ServerForCreate;
import com.woorea.openstack.nova.model.Servers;

/**
 *
 */
@Service
public class UserCloudService {
	
	@Autowired
	private UserCloudDao uceDao;
	@Autowired
	private CloudDao ceDao;
	
	public UserCloud get(int id) {
		return uceDao.get(id);
	}
	
	public UserCloud getMyUCE(int userId) {
		return uceDao.getMyUCE(userId);
	}
	
	public Cloud getMyCloud(int userId)
	{
		UserCloud uc = this.getMyUCE(userId);
		if (uc != null)
		{
			return ceDao.get(uc.getCloudId());
		}
		else
		{
			return null;
		}
	}
	
	public boolean save(int userId,String ip,String name,String password)
	{
		Cloud cloud = ceDao.getCloud(ip);
		UserCloud userCloud = uceDao.getMyUCE(userId);
		if (cloud != null)
		{
			//别人的云平台
			if (cloud.getUserId() != userId)
			{
				return false;
			}
			else
			{
				cloud.setName(name);
				cloud.setPassword(password);
				ceDao.update(cloud);
				
				if (userCloud == null)
				{
					UserCloud uce = new UserCloud();
					uce.setUserId(userId);
					uce.setCloudId(cloud.getId());
					uceDao.save(uce);
					return true;
				}
				return true;
			}
		}
		else
		{
			Cloud c = new Cloud();
			c.setIp(ip);
			c.setName(name);
			c.setPassword(password);
			c.setUserId(userId);
			ceDao.save(c);
			if (userCloud != null)
			{
				userCloud.setCloudId(c.getId());
				uceDao.update(userCloud);
				return true;
			}
			else
			{
				UserCloud uce = new UserCloud();
				uce.setUserId(userId);
				uce.setCloudId(c.getId());
				uceDao.save(uce);
				return true;
			}
			
		}
	}
	
	public void delete(int id) {
		uceDao.remove(uceDao.get(id));
	}
	
	public String[] createServer(int userId,String serverName) {
		
		UserCloud userCloud = uceDao.getMyUCE(userId);
		if (userCloud == null)
		{
			return null;
		}
		Cloud cloud = ceDao.get(userCloud.getCloudId());
		if (cloud == null)
		{
			return null;
		}
		String authurl = "http://"+cloud.getIp()+":35357/v2.0";
		String name = cloud.getName();
		String password = cloud.getPassword();
		String endpoint = "http://"+cloud.getIp()+":8774/v2/";
		Keystone keystone = new Keystone(authurl);
		Access access = keystone
				.tokens()
				.authenticate(
						new UsernamePassword(name,password))
				.withTenantName("admin").execute();

		keystone.token(access.getToken().getId());

		Nova nova = new Nova(endpoint.concat("/").concat(
				access.getToken().getTenant().getId()));
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		// KeyPairs keysPairs = nova.keyPairs().list().execute();
		Images images = nova.images().list(true).execute();
		List<Image> imagelist =  images.getList();
		String id = null;
		for (Image image:imagelist)
		{
			String imagename = image.getName();
			if ("CentOS-6.5-x86_64".equals(imagename))
			{
				id = image.getId();
			}
		}
		if (id == null)
		{
			return null;
		}
		// Flavors flavors = nova.flavors().list(true).execute();
		ServerForCreate serverForCreate = new ServerForCreate();
		serverForCreate.setName(serverName);
		serverForCreate.setFlavorRef("2");
		serverForCreate.setImageRef(id);
		serverForCreate.setKeyName("hello_key");
		serverForCreate.getSecurityGroups().add(
				new ServerForCreate.SecurityGroup("default"));

		Server server = nova.servers().boot(serverForCreate).execute();
		String[] strs = new String[4];
		String ip = null;
		boolean flag = true;
		int index = 0;
		while (flag) {
			try {
				ip = getServerIP(server.getId(),nova);
				if (ip != null) {
					flag = false;
				}
				Thread.sleep(1000);
				index ++;
				if (index > 60)//如果实在很长时间还没有返回，就算没有创建成功
				{
					return null;
				}
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		strs[0] = ip;
		strs[1] = "root";
		strs[2] = "000000";
		strs[3] = server.getId();
		return strs;
	}
	
	private String getServerIP(String serverId,Nova nova) {

		Servers servers = nova.servers().list(true).execute();
		for (Server server : servers) {
			if (server != null && server.getId().equals(serverId)) {
				if (server.getAddresses() == null) {
					return null;
				}
				Map<String, List<Address>> address = server.getAddresses()
						.getAddresses();
				List<Address> alist = address.get("flatnet");
				if (alist == null) {
					return null;
				}
				if (alist.size() > 0) {
					String ip = alist.get(0).getAddr();
					return ip;
				}
			}
		}
		return null;
	}
	
	public void delServer(int userId,String serverId) {
		
		UserCloud userCloud = uceDao.getMyUCE(userId);
		if (userCloud == null)
		{
			return;
		}
		Cloud cloud = ceDao.get(userCloud.getCloudId());
		if (cloud == null)
		{
			return;
		}
		String authurl = "http://"+cloud.getIp()+":35357/v2.0";
		String name = cloud.getName();
		String password = cloud.getPassword();
		String endpoint = "http://"+cloud.getIp()+":8774/v2/";
		
		Keystone keystone = new Keystone(authurl);
		Access access = keystone
				.tokens()
				.authenticate(
						new UsernamePassword(name,password))
				.withTenantName("admin").execute();

		keystone.token(access.getToken().getId());

		Nova nova = new Nova(endpoint.concat("/").concat(
				access.getToken().getTenant().getId()));
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		ServersResource.Delete startServer = nova.servers().delete(serverId);
		startServer.endpoint(endpoint);
		startServer.execute();
	}

}
