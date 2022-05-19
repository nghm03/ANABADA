package go.to.mars;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import go.to.mars.service.ProductService;

@Controller
public class HomeController {

    @Autowired
    ProductService service;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        model.addAttribute("pvl", service.selectProductList());
        return "home";

    }

    //메인홈 이동 메소드
    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String main() {
        return "redirect:/";
    }

    @RequestMapping(value = "OurStoryPage", method = RequestMethod.GET)
    public String OurStoryPage() {
        return "OurStoryPage";
    }

    @RequestMapping(value = "ContactPage", method = RequestMethod.GET)
    public String ContactPage() {
        return "ContactPage";
    }

    @RequestMapping(value = "NewFile", method = RequestMethod.GET)
    public String NewFile() {
        //System.out.println("장바구니 함보까");
        return "NewFile";
    }

    @RequestMapping(value = "payment", method = RequestMethod.GET)
    public String payment() {
        //System.out.println("장바구니 펼쳐보까");
        return "NewFile2";
    }
}