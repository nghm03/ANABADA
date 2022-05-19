package go.to.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserVO {

    private String user_id;
    private String password;
    private String name;
    private String ssn; 
    private int post_code; 
    private String address;
    private String detail_address;
    private String phone;
    private String email;
    private int clause;
    private int cash;
	
}