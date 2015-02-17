package com.dhl.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhl.domain.User;

@Repository
public class UserDao extends BaseDao<User>  {

	public User getUserBymail(String email) {
		String hql = "from User where email=?";
		List<User> list = find(hql,email);
		User user = null;
		if (list != null && list.size() > 0)
		{
			user = list.get(0);
		}
		return user;
	}

	public User getUserByUserName(String userName) {
		String hql = "from User where username=?";
		List<User> list = find(hql,userName);
		User user = null;
		if (list != null && list.size() > 0)
		{
			user = list.get(0);
		}
		return user;
	}

	public void removeAlluser()
	{
		String hql = "delete from User where username != 'admin'";
		this.getSession().createQuery(hql).executeUpdate();
	}
//	public void remove(int id) {
//		User user = get(id);
//		if (user != null)
//		{
//			remove(user);
//		}
//	}
	
//	public void update(String email, String username,
//			String name, String gender, String mailing_address,
//			String year_of_birth, String level_of_education, String goals) {
//		User user = getUserBymail(email);
//		if (user != null) {
//			jdbcTemplate
//					.update("update auth_user set username = ? where email = ?",
//							new Object[] { username, email });
//
//			jdbcTemplate
//					.update("update auth_userprofile set name = ?, gender = ?,mailing_address= ?,year_of_birth= ?,level_of_education= ?,goals= ? where user_id = ?",
//							new Object[] { name, gender, mailing_address,
//									year_of_birth, level_of_education, goals,
//									user.getId() });
//		}
//	}
	
//	public User save(String roleName, String email, String password,
//			String username, String name, String gender,
//			String mailing_address, String year_of_birth,
//			String level_of_education, String goals, String school_name,
//			String major, String class_name, String admission_time){
//
//		String last_login = UtilTools.timeTostrHMS(new Date());
//		String date_joined = UtilTools.timeTostrHMS(new Date());
//		MD5 md5 = new MD5();
//		String pw = md5.getMD5ofStr(password);
//
//		final User user = new User();
//		user.setUsername(username);
//		user.setFirst_name("");
//		user.setLast_name("");
//		user.setEmail(email);
//		user.setPassword(pw);
//		user.setIs_staff(0);
//		user.setIs_active(0);
//		user.setIs_superuser(0);
//		user.setLast_login(last_login);
//		user.setDate_joined(date_joined);
//
//		final String sql = "insert into auth_user(username,first_name,last_name,email,password,is_staff,is_active,is_superuser,last_login,date_joined) values(?,?,?,?,?,?,?,?,?,?)";
//		KeyHolder keyHolder = new GeneratedKeyHolder();
//		
//		try {
//			Connection con = jdbcTemplate.getDataSource().getConnection();
//			PreparedStatement ps = con.prepareStatement(sql,new String[] { "user_id", "address_id" });
//			MyStatementCreate mc = new MyStatementCreate(user,ps);
//			jdbcTemplate.update(mc, keyHolder);
//			ps.close();
//			con.close();
//		} catch (SQLException e1) {
//			e1.printStackTrace();
//		}
//		
//		user.setId(keyHolder.getKey().intValue());
//		
//		Integer yb = null;
//		if (!"".equals(year_of_birth)) {
//			yb = Integer.parseInt(year_of_birth);
//		}
//		jdbcTemplate
//				.update("insert into auth_userprofile(user_id,name,courseware,allow_certificate,gender,mailing_address,language,location,meta,year_of_birth,level_of_education,goals,school_name,major,class_name,admission_time) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
//						new Object[] { user.getId(), name, "course.xml", 1,
//								gender, mailing_address, "", "","", yb,
//								level_of_education, goals, school_name, major,
//								class_name, admission_time });
//
//		Role role = null;
//		try {
//			role = (Role) jdbcTemplate.queryForObject(
//					"select * from t_role where roleName=?",
//					new Object[] { roleName }, new RowMapper() {
//						@Override
//						public Object mapRow(ResultSet rs, int rowNum)
//								throws SQLException {
//							Role emp = new Role();
//							emp.setId(rs.getInt("id"));
//							emp.setRoleName(rs.getString("roleName"));
//							emp.setRoleDesc(rs.getString("roleDesc"));
//							return emp;
//						}
//					});
//		} catch (Exception e) {
//		}
//		if (role != null) {
//			user.setRole(role);
//		}
//		jdbcTemplate.update(
//				"insert into t_roleuser(userId,roleId) values(?,?)",
//				new Object[] { user.getId(), role.getId() });
//
//		return user;
//	}

//	public List<User> getAllTeacher(String str) {
//		String sql = "select au.id,au.username from t_role as r,t_roleuser as ru,auth_user as au where r.roleName = '"+str+"' and r.id = ru.roleId and ru.userId = au.id";
//		List rows = jdbcTemplate.queryForList(sql);
//		List<User> user = new ArrayList();
//		Iterator it = rows.iterator();
//		while(it.hasNext()) {
//		    Map userMap = (Map) it.next();
//		    User emp = new User();
//			emp.setId((int)userMap.get("id"));
//			emp.setUsername((String)userMap.get("username"));
//			user.add(emp);
//		}
//		return user;
//	}

	public List<User> getAllUser() {
		String hql = "from User where username!= 'admin'";
		return find(hql);
//		String sql = "select au.id,au.username,au.email,aupro.school_name,r.roleName from auth_user as au,auth_userprofile as aupro,t_role as r,t_roleuser as ru where au.id=aupro.user_id and r.id = ru.roleId and ru.userId = au.id";
//		List rows = jdbcTemplate.queryForList(sql);
//		List<User> user = new ArrayList();
//		Iterator it = rows.iterator();
//		while(it.hasNext()) {
//		    Map userMap = (Map) it.next();
//		    User emp = new User();
//			emp.setId((int)userMap.get("id"));
//			emp.setUsername((String)userMap.get("username"));
//			emp.setEmail((String)userMap.get("email"));
//			emp.setSchoolname((String)userMap.get("school_name"));
//			Role role = new Role();
//			role.setRoleName((String)userMap.get("roleName"));
//			emp.setRole(role);
//			user.add(emp);
//		}
//		return user;
	}
	
//	public List<User> getStudentBySchoolName(String roleName, String schoolname) {
//		String sql = "select au.id,au.username from t_role as r,t_roleuser as ru,auth_user as au,auth_userprofile as aup where r.roleName = '"+roleName+"' and r.id = ru.roleId and ru.userId = au.id and aup.school_name = '"+schoolname+"' and au.id = aup.user_id";
//		List rows = jdbcTemplate.queryForList(sql);
//		List<User> user = new ArrayList();
//		Iterator it = rows.iterator();
//		while(it.hasNext()) {
//		    Map userMap = (Map) it.next();
//		    User emp = new User();
//			emp.setId((int)userMap.get("id"));
//			emp.setUsername((String)userMap.get("username"));
//			user.add(emp);
//		}
//		return user;
//	}

//	public UserProfile getUserProfileByuserId(int userId) {
//		UserProfile user = null;
//		try {
//			user = (UserProfile) jdbcTemplate.queryForObject(
//					"select * from auth_userprofile where user_id=?",
//					new Object[] { userId }, new RowMapper() {
//						@Override
//						public Object mapRow(ResultSet rs, int rowNum)
//								throws SQLException {
//							UserProfile emp = new UserProfile();
//							emp.setId(rs.getInt("id"));
//							emp.setName(rs.getString("name"));
//							emp.setGender(rs.getString("gender"));
//							emp.setGoals(rs.getString("goals"));
//							emp.setMailing_address(rs
//									.getString("mailing_address"));
//							emp.setLevel_of_education(rs
//									.getString("level_of_education"));
//							emp.setYear_of_birth(rs.getInt("year_of_birth"));
//							return emp;
//						}
//					});
//			return user;
//		} catch (Exception e) {
//			return null;
//		}
//	}
}
