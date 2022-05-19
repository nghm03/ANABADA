package go.to.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProductVO{
	private int product_num;			// 제품 넘버
	private String product_name;		// 제품 이름
	private int product_price;			// 제품 가격
	private String product_category;	// 제품 종류
	private String product_add_date;	// 제품 등록날짜 (일주일)
	private int product_stock;			// 제품 판매여부 (있을때 1, 없을때 0)
	private String product_content;		// 제품 내용
	private String product_image;		// 제품 사진
}
