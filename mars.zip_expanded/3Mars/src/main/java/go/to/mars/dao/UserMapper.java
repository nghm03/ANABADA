package go.to.mars.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import go.to.mars.vo.CartVO;
import go.to.mars.vo.ContactVO;
import go.to.mars.vo.UserVO;

public interface UserMapper {
	
	public int signUp(UserVO userVO);
	public UserVO searchUser(String id);
	public String searchId(UserVO userVO);
	public int updatePw(UserVO userVO); 
	public UserVO userInfo(String user_id);
	public int userUpdate(UserVO uservo);
	public int love(ContactVO contact);
	public int cashUpdate(HashMap<String, Object> cash);
	public List<CartVO> userContact(String user_id);
}

