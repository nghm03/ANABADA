package go.to.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BuyinfoVO {

	private int buy_num;			// 구매 번호
	private String user_id;			// 유저 아이디
	private int product_num;		// 제품 넘버
	private String product_name;	// 제품 이름
	private int product_price;		// 제품 가격
	private String email;			// 유저 이메일
	private String phone;			// 유저 전화번호
    private int post_code; 			// 우편번호
	private String address;			// 도로명 주소
	private String detail_address;	// 상세 주소
	private String buy_time;		// 구매 시간
	private String product_image;   // 이미지
	private String buyInfo_stock; 		// 제품 배송여부
}
