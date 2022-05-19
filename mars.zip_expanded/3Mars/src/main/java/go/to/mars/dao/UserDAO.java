package go.to.mars.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import go.to.mars.vo.CartVO;
import go.to.mars.vo.ContactVO;
import go.to.mars.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession session;
	
	public int signUp(UserVO userVO) {
		int conut = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			conut = mapper.signUp(userVO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return conut;
	}
	
	public UserVO searchUser(String id) {
		UserVO uv = new UserVO();
		System.out.println("-------" + id);
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			uv = mapper.searchUser(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(uv);
		return uv;
	}
	
	
	public String searchId(UserVO userVO) {
		String id = "";
		//System.out.println("-------" + userVO);
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			id = mapper.searchId(userVO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(id);
		return id;
	}
	
	public int updatePw (UserVO userVO) {
		int conut = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			conut = mapper.updatePw(userVO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return conut;
	}
	
    
    public UserVO userInfo(String user_id) {
        UserVO uservo = new UserVO();
        try {
            UserMapper mapper = session.getMapper(UserMapper.class);
            uservo = mapper.userInfo(user_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uservo;
    }

    public List<CartVO> cartList(String user_id) {
        List<CartVO> list = new ArrayList<>();    
        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            list = mapper.cartlist(user_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int userUpdate(UserVO uservo) {
        int result = 0;
        try {
            UserMapper mapper = session.getMapper(UserMapper.class);
            
            result = mapper.userUpdate(uservo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int love(ContactVO contact) {
        int result = 0;
        try {
            UserMapper mapper = session.getMapper(UserMapper.class);
            
            result = mapper.love(contact);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int cashUpdate(int value, String user_id) {
        int result = 0;
        try {
            UserMapper mapper = session.getMapper(UserMapper.class);
            UserVO user = mapper.searchUser(user_id);
            int sum = user.getCash(); 
            sum += value;
            System.out.println("추가된 캐시 : " + sum);
            
            HashMap<String, Object> cash = new HashMap<>();
            cash.put("user_id", user_id);
            cash.put("cash", sum);
            
            result = mapper.cashUpdate(cash);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

	public Object userContact(String user_id) {
		List<CartVO> list = new ArrayList<>();
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.userContact(user_id);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
