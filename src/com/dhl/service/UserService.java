package com.dhl.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.RoleDao;
import com.dhl.dao.UserDao;
import com.dhl.dao.UserProfileDao;
import com.dhl.dao.UserRoleDao;
import com.dhl.domain.Role;
import com.dhl.domain.User;
import com.dhl.domain.UserProfile;
import com.dhl.domain.UserRole;
import com.dhl.util.MD5;

/**
 * 用户管理服务器，负责查询用户、注册用户、锁定用户等操作
 *
 */
@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private UserProfileDao userProfileDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private UserRoleDao userRoleDao;
	
	/**
	 * 保存用户
	 * @param user
	 */
	public User save(String roleName, String email,
			String password, String username, String name, String gender,
			String mailing_address, String year_of_birth,
			String level_of_education, String goals,String school_name,String major,String class_name,String admission_time)
	{
		User user = new User();
		user.setEmail(email);
		MD5 md5 = new MD5();
		user.setPassword(md5.getMD5ofStr(password));
		user.setUsername(username);
		user.setIs_active(0);
		user.setIs_staff(0);
		user.setIs_superuser(0);
		user.setLast_login(new Date());
		user.setDate_joined(new Date());
		user.setFirst_name("");
		user.setLast_name("");
		userDao.save(user);
		UserProfile upf = new UserProfile();
		upf.setUser_id(user.getId());
		upf.setName(name);
		upf.setAllow_certificate(1);
		upf.setCourseware("course.xml");
		upf.setGender(gender);
		upf.setMailing_address(mailing_address);
		upf.setLanguage("");
		upf.setLocation("");
		upf.setMeta("");
		if (!"".equals(year_of_birth))
		{
			int yb = Integer.parseInt(year_of_birth);
			upf.setYear_of_birth(yb);
		}
		upf.setLevel_of_education(level_of_education);
		upf.setGoals(goals);
		upf.setSchool_name(school_name);
		upf.setMajor(major);
		upf.setClass_name(class_name);
		upf.setAdmission_time(admission_time);
		userProfileDao.save(upf);
		Role role = roleDao.getRoleByname(roleName);
		UserRole ur = new UserRole();
		ur.setRoleId(role.getId());
		ur.setUserId(user.getId());
		userRoleDao.save(ur);
		return user;
	}
	
//	/**
//	 * 保存用户
//	 * @param user
//	 */
//	public void save(User user)
//	{
//		userDao.save(user);
//	}
//	
//	/**
//	 * 保存用户属性
//	 * @param user
//	 */
//	public void saveProfile(UserProfile userProfile)
//	{
//		userProfileDao.save(userProfile);
//	}
	
	/**
	 * 根据邮箱查找用户
	 * @param mail
	 * @return
	 */
	public User getUserBymail(String email)
	{
		return userDao.getUserBymail(email);
	}
	
	/**
	 * 取得用户的角色
	 * @param userId
	 * @return
	 */
	public Role getUserRoleByuserId(int userId)
	{
		UserRole ur = userRoleDao.getUserRoleByUserId(userId);
		Role role = roleDao.get(ur.getRoleId());
		return role;
	}
	
	/**
     * 更新用户
     * @param user 
     */
    public void update(User user){
        userDao.update(user);
    }
    
	   /**
     * 根据用户名/密码查询 User对象
     * @param userName 用户名
     * @return User
     */
//    public User getUserByUserName(String userName,String password){
//        return userDao.getUserByUserName(userName,password);
//    }
	
    public User getUserByUserName(String userName){
        return userDao.getUserByUserName(userName);
    }
	/**
	 * 根据userId加载User对象
	 * @param userId
	 * @return
	 */
	public User getUserById(int userId){
		return userDao.get(userId);
	}
	
	
	/**
	 * 根据用户名为条件，执行模糊查询操作 
	 * @param userName 查询用户名
	 * @return 所有用户名前导匹配的userName的用户
	 */
//	public List<User> queryUserByUserName(String userName){
//		return userDao.queryUserByUserName(userName);
//	}
	
	/**
	 * 获取所有用户
	 * @return 所有用户
	 */
	public List<User> getAllUsers(){
		return userDao.loadAll();
	}
	
	/**
	 * 获取所有老师
	 * @return 所有用户
	 */
	public List<UserRole> getAllTeacher(){
		Role role = roleDao.getRoleByname(CommonConstant.ROLE_T);
		return userRoleDao.getUserRoleByRoleId(role.getId());
	}
	
	/*public Page getPage(int pageNo,int pageSize)
    {
    	return userDao.getPage(pageNo, pageSize);
    }*/
}
