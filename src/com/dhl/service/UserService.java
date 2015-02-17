package com.dhl.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.RoleDao;
import com.dhl.dao.UserDao;
import com.dhl.dao.UserProfileDao;
import com.dhl.dao.UserRoleDao;
import com.dhl.domain.Role;
import com.dhl.domain.User;
import com.dhl.domain.UserProfile;
import com.dhl.domain.UserRole;
import com.dhl.util.MD5;
import com.dhl.util.UtilTools;

@Service
public class UserService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserRoleDao userRoleDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private UserProfileDao userProfileDao;
	
	public User getUserBymail(String email) {
		User user = userDao.getUserBymail(email);
		if (user != null)
		{
			UserRole ur = userRoleDao.getUserRole(user.getId());
			if (ur != null)
			{
				Role r = roleDao.get(ur.getRoleId());
				if (r != null)
				{
					user.setRole(r);
				}
			}
		}
		return user;
	}

	public User getUserByUserName(String userName) {
		User user = userDao.getUserByUserName(userName);
		if (user != null)
		{
			UserRole ur = userRoleDao.getUserRole(user.getId());
			if (ur != null)
			{
				Role r = roleDao.get(ur.getRoleId());
				if (r != null)
				{
					user.setRole(r);
				}
			}
		}
		return user;
	}

	public User getUserById(int userId) {
		User user = userDao.get(userId);
		if (user != null)
		{
			UserRole ur = userRoleDao.getUserRole(user.getId());
			if (ur != null)
			{
				Role r = roleDao.get(ur.getRoleId());
				if (r != null)
				{
					user.setRole(r);
				}
			}
		}
		return user;
	}

	public User save(String roleName, String email, String password,
			String username, String name, String gender,
			String mailing_address, String year_of_birth,
			String level_of_education, String goals, String school_name,
			String major, String class_name, String admission_time) {
		
		String last_login = UtilTools.timeTostrHMS(new Date());
		String date_joined = UtilTools.timeTostrHMS(new Date());
		MD5 md5 = new MD5();
		String pw = md5.getMD5ofStr(password);

		User user = new User();
		user.setUsername(username);
		user.setFirst_name("");
		user.setLast_name("");
		user.setEmail(email);
		user.setPassword(pw);
		user.setIs_staff(0);
		user.setIs_active(0);
		user.setIs_superuser(0);
		user.setLast_login(last_login);
		user.setDate_joined(date_joined);
		
		userDao.save(user);
		
		UserProfile up = new UserProfile();
		up.setUser_id(user.getId());
		up.setName(name);
		up.setCourseware("course.xml");
		up.setAllow_certificate(1);
		up.setGender(gender);
		up.setMailing_address(mailing_address);
		up.setLanguage("");
		up.setLocation("");
		up.setMeta("");
		up.setYear_of_birth(Integer.parseInt(year_of_birth));
		up.setLevel_of_education(level_of_education);
		up.setGoals(goals);
		up.setSchool_name(school_name);
		up.setMajor(major);
		up.setClass_name(class_name);
		up.setAdmission_time(admission_time);
		
		userProfileDao.save(up);
		
		Role role = roleDao.getByRoleName(roleName);
		if (role != null)
		{
			user.setRole(role);
			UserRole ur = new UserRole();
			ur.setUserId(user.getId());
			ur.setRoleId(role.getId());
			userRoleDao.save(ur);
		}
		return user;
	}

	public List<UserRole> getAllTeacher(String roleName) {
		Role role = roleDao.getByRoleName(roleName);
		return userRoleDao.getByRoleId(role.getId());
	}

	public List<User> getStudentBySchoolName(String roleName,String schoolname) {
		
		Role role = roleDao.getByRoleName(roleName);
		List<UserRole> list = userRoleDao.getByRoleId(role.getId());
		List<User> userList = new ArrayList();
		for (UserRole ur:list)
		{
			User user = userDao.get(ur.getUserId());
			UserProfile up = userProfileDao.getByUserId(user.getId());
			if (schoolname != null && schoolname.equals(up.getSchool_name()))
			{
				userList.add(user);
			}
		}
		return userList;
	}

	public UserProfile getUserProfileByuserId(int userId) {
		return userProfileDao.getByUserId(userId);
	}

	public void update(User user,String name, String gender,
			String mailing_address, String year_of_birth,
			String level_of_education, String goals) {
		
		update(user);
		
		UserProfile up = userProfileDao.getByUserId(user.getId());
		if (up != null)
		{
			up.setName(name);
			up.setGender(gender);
			up.setMailing_address(mailing_address);
			up.setYear_of_birth(Integer.parseInt(year_of_birth));
			up.setLevel_of_education(level_of_education);
			up.setGoals(goals);
			
			userProfileDao.update(up);
		}
	}

	public void update(User user)
	{
		userDao.update(user);
	}
	
	//性能有问题再处理
	public List<User> getAllUser() {
		
		List<User> list = userDao.getAllUser();
		for (User u:list)
		{
			UserProfile up = userProfileDao.getByUserId(u.getId());
			if (up != null)
			{
				u.setSchoolname(up.getSchool_name());
				UserRole ur = userRoleDao.getUserRole(u.getId());
				if (ur != null)
				{
					Role role = roleDao.get(ur.getRoleId());
					u.setRole(role);
				}
			}
		}
		return list;
	}
	
	public void remove(int id) {
		User user = userDao.get(id);
		if (user != null)
		{
			userDao.remove(user);
		}
	}
	
	public void removeAlluser() {
		userDao.removeAlluser();
	}
}
