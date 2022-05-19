package go.to.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ContactVO {
	
    private int contact_num;        // 컨텍 고유번호
    private String user_id;         // 유저 아이디
    private String email;           // 유저 이메일
    private String product_title;   // 제품 제목
    private String product_info;    // 제품 정보
    private String user_comment;    // 유저 TMI
	
}
