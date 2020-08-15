package com.chengyong.sys.serviceImpl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.chengyong.sys.entity.SysLogLogin;
import com.chengyong.sys.entity.SysRole;
import com.chengyong.sys.entity.SysUsers;
import com.chengyong.sys.mapper.SysLogLoginMapper;
import com.chengyong.sys.mapper.SysRoleMapper;
import com.chengyong.sys.mapper.SysRoleUsersMapper;
import com.chengyong.sys.mapper.SysUsersMapper;
import com.chengyong.sys.service.SysUsersService;
import com.chengyong.sys.util.CUD_CallbackInfo;
import com.chengyong.sys.util.DataView;
import com.chengyong.sys.util.Publicvalue;
import com.chengyong.sys.util.SysUsersVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SysUsersServiceImpl implements SysUsersService{
    @Autowired
    private SysUsersMapper sysUsersMapper;
    
    @Autowired
    private SysRoleUsersMapper sysRoleUsersMapper;
    
    @Autowired
    private SysRoleMapper sysRoleMapper;
    
    //将加密对象实现用于 用户添加密码的加密
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
    
    //录入日志
    @Autowired
    private SysLogLoginMapper sysLogLoginMapper;

    
    /**
     * 用户删除
     */
	@Override
	public int deleteByPrimaryKey(Short userid) {
		//删除用户，同时需要删除 对应的角色权限，也就是删除用户表和角色表两个关联的中间表中对应id的数据
		sysRoleUsersMapper.deleteByPrimaryKey(userid);
		
		return sysUsersMapper.deleteByPrimaryKey(userid);
	}

	/**
	 * 用户插入
	 */
	@Override
	public int insert(SysUsers record) {
		//String md5PWD = DigestUtils.md5DigestAsHex(record.getPwd().getBytes());
		record.setPwd(bcryptPasswordEncoder.encode(record.getPwd())); //使用springSecurity的加密
		record.setHeadpic(CUD_CallbackInfo.DEFAULT_HEAD_PIC);
		return sysUsersMapper.insert(record);
	}

	@Override
	public int insertSelective(SysUsers record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(SysUsers record) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 用户修改
	 */
	@Override
	public int updateByPrimaryKey(SysUsers record) {
		//String md5PWD = DigestUtils.md5DigestAsHex(record.getPwd().getBytes());
		record.setPwd(bcryptPasswordEncoder.encode(record.getPwd())); //使用springSecurity的加密
		return sysUsersMapper.updateByPrimaryKey(record);
	}

	/**
	 * 用户登录
	 	*/
	@Override
	public SysUsers LoginUser(SysUsers sysUsers) {
		String md5PWD = DigestUtils.md5DigestAsHex(sysUsers.getPwd().getBytes());
		sysUsers.setPwd(md5PWD);
		SysUsers user = sysUsersMapper.LoginUser(sysUsers);
		if(user!=null) {
			return user;
		}else {
			return null;
		}
		
	}


	/**
	 * 所有用户的显示
	 */
	@Override
	public DataView selectByPrimaryKey(SysUsers sysUsers) {
		Page<Object> page = PageHelper.startPage(sysUsers.getPage(), sysUsers.getLimit());
		List<SysUsers> list = sysUsersMapper.selectByPrimaryKey(sysUsers);
		PageInfo<SysUsers> info = new PageInfo<SysUsers>(list);
		return new DataView(info.getTotal(), list);
	}

	/**
	 * 用户批量删除
	 */
	@Override
	public int deleteByPrimaryKeyLot(SysUsersVo sysUsersVo) {
		int j = 0;
		try {
			for (int i = 0;i<sysUsersVo.getIds().length;i++) {
				j = sysUsersMapper.deleteByPrimaryKey(sysUsersVo.getIds()[i]);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return j;
			
	}

	/**
	 * 用户重置密码 默认密码 123456
	 */
	@Override
	public int uesrReset(Short userid) {
		SysUsers sysUsers = new SysUsers();
		//String md5PWD = DigestUtils.md5DigestAsHex(Publicvalue.PWD.getBytes());
		//sysUsers.setPwd(md5PWD);
		sysUsers.setPwd(bcryptPasswordEncoder.encode(Publicvalue.PWD)); //使用springSecurity的加密
		sysUsers.setUserid(userid);
		return sysUsersMapper.uesrReset(sysUsers);
	}

	@Override
	public int uesrPwdUpdate(SysUsersVo record) {
		//String md5PWD = DigestUtils.md5DigestAsHex(record.getNewPwd().getBytes());
		//record.setNewPwd(md5PWD);
		record.setPwd(bcryptPasswordEncoder.encode(record.getPwd()));
		return sysUsersMapper.uesrPwdUpdate(record);
	}

	@Override
	public SysUsers addUser(SysUsers sysUsers) {
		return sysUsersMapper.addUser(sysUsers);
	}

	@Override
	public List<SysUsers> oldPwd(SysUsersVo record) {
		//String md5PWD = DigestUtils.md5DigestAsHex(record.getOldPwd().getBytes());
		//record.setOldPwd(md5PWD);
		record.setPwd(bcryptPasswordEncoder.encode(record.getPwd()));
		return sysUsersMapper.oldPwd(record);
	}

	@Override
	public int updateByLogname(SysUsers sysUsers) {
		return sysUsersMapper.updateByLogname(sysUsers);
	}

	@Override
	public int uesrHeadPicUpdate(SysUsers sysUsers) {
		return sysUsersMapper.uesrHeadPicUpdate(sysUsers);
	}

	/**
	 * String username 获取用户名
	 * 
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    SysUsers sysUsers = new SysUsers();
	    sysUsers.setLogname(username);
	    
	    try {
	    	//使用springmvc 监听request获取
	    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                    .getRequest();
	    	//根据用户名做查询
	    	SysUsers users = sysUsersMapper.LoginUser(sysUsers);
	    	if(users==null) {
	    		return null;
	    	}
	    	
	    	request.getSession().setAttribute("userName", users.getLogname());
	    	request.getSession().setAttribute("userPic", users.getHeadpic());
	    	//------------------------日志--------------------------
	    	
	    	   SysLogLogin sysLogLogin = new SysLogLogin();
			   sysLogLogin.setLoginname(sysUsers.getLogname());
			   //SimpleDateFormat format = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss");
			   //String time = format.format(new Date());
			   sysLogLogin.setLogintime(new Date());
			   sysLogLogin.setLoginip(request.getRemoteAddr()); //获取ip地址
			   sysLogLoginMapper.insert(sysLogLogin);
	    	
	    	//--------------------------录入----------------------------
	    	
	    	//将用户的权限都放到 list集合里面
	    	List<SimpleGrantedAuthority> authorities = new ArrayList<>();
	    	List<SysRole> roles = sysRoleMapper.SECURITY_ROLE(users.getUserid());
	    	
	    	for (SysRole sysRole : roles) {
	    		authorities.add(new SimpleGrantedAuthority(sysRole.getRolename()));
			}
	    	
	    	
	    	//进行用户 权限设置
	    	UserDetails userDetails = new User(
	    			users.getLogname(),
	    			users.getPwd(),
	    			users.getType()==1, // 用户是否可用的状态判断
	    			true,
	    			true,
	    			true,
	    			authorities
	    			);
	    	
	    	//new User(
//	    	username
//	    	, password
//	    	, enabled  用户的状态是否可以用
//	    	, accountNonExpired // 账户是否失效
//	    	, credentialsNonExpired  //密码是否失效
//	    	, accountNonLocked  账户是否被锁定
//	    	, authorities);
	    	
			return userDetails;
		} catch (Exception e) {
			e.printStackTrace();
			//返回空  默认就是认证失败
			return null;
		}
		
	}



}
