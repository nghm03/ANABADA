package go.to.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SellVO {
	private int sell_num;		// 판매 넘버
	private String user_id;
	private int product_num;		// 제품 넘버
	private String product_name;
	private int product_price;
	private String email;
	private String phone;
	private String sell_time;
}
