package go.to.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CartVO {
	private int cart_num;		// 장바구니 넘버
	private String user_id; 	// 유저 아이디
	private int product_num;	// 제품 넘버
	private String product_name;// 제품 이름
	private int product_price;	// 제품 가격
	private String product_image;// 제품 사진
	private String product_content; // 제품 내용


}
