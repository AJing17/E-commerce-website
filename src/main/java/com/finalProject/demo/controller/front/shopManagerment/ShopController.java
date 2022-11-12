package com.finalProject.demo.controller.front.shopManagerment;


import com.finalProject.demo.model.entity.product.Products;
import com.finalProject.demo.repository.product.ProductRepository;
import com.finalProject.demo.service.cart.CartService;
import com.finalProject.demo.service.product.PhotoService;
import com.finalProject.demo.service.product.ProductService;
import com.finalProject.demo.service.product.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class ShopController {
    @Autowired
    private ShopService shopService;
    ProductService productService;
    PhotoService photoService;
    @Autowired
    CartService cartservice;

    @Autowired
    ProductRepository productRepository;


    /*
     * 設定每頁有幾筆商品顯示在頁面上
     * 第一頁:http://localhost:8080/Chezmoi/shop/page
     * 第二頁:http://localhost:8080/Chezmoi/shop/page?p=2 以此類推
     */
    @GetMapping("/shop")
    public String viewProducts(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
        Page<Products> page = shopService.findByPage(pageNumber);
        model.addAttribute("page", page);
        return "front/shop";

    }


    /*
    for Index頁面Best Selling的Ajax
    */
    @ResponseBody
    @GetMapping("/BestSelling")
    public List<Map<String, Object>> BestSelling() {
        List<Map<String, Object>> objList = shopService.BestSelling();
        return objList;
    }

    /*
     將後臺status=on的商品視為推薦商品=>顯示於Index
     */
    @ResponseBody
    @GetMapping("/RecommendedItems")
    public List<Map<String, Object>> RecommendedItems() {
        List<Map<String, Object>> objList = shopService.RecommendedItems();
        for (Map<String, Object> stringObjectMap : objList) {
            System.out.println("stringObjectMap = " + stringObjectMap);
        }
        return objList;
    }

    /*
    for Shop頁面的Ajax
     */
    @ResponseBody
    @GetMapping("/distinctProduct")
    public List<Map<String, Object>> distinctProduct() {
        List<Map<String, Object>> objList = shopService.distinctProduct();
        return objList;
    }

    /*
     設定按下商品分類可跳出相對應的商品
    */
    @GetMapping("/shop/{category}")
    public String distinctCatProduct(@PathVariable String category, Model model) {
        List<Map<String, Object>> objListCat = shopService.distinctCatProduct(category);
        model.addAttribute("category", objListCat);
        return "front/CatProduct";
    }



    /*
     * 製作點擊商品名字可以進入"商品明細"
     */
    @GetMapping("/shop/productDetail")
    public String productdetail(@RequestParam("series") String series, Model model) {
        //商品明細內頁秀出color跟size
        List<Products> productSeries = shopService.findBySeries(series);
        model.addAttribute("productSeries", productSeries);
        //series陣列取出productId
        Products productsId = shopService.findById(productSeries.get(0).getProductId());
        model.addAttribute("productsId", productsId);
        return "front/productDetail";
    }

    /*
for ShopDetail頁面Size的Ajax
 */
    @ResponseBody
    @GetMapping("/distinctSize")
    public List<Map<String, Object>> distinctSize(@RequestParam("series") String series) {
        List<Map<String, Object>> objListSize = shopService.distinctSize(series);
        return objListSize;
    }

    /*
    for ShopDetail頁面Color的Ajax
     */
    @ResponseBody
    @GetMapping("/distinctColor")
    public List<Map<String, Object>> distinctColor(@RequestParam("series") String series) {
        List<Map<String, Object>> objListColor = shopService.distinctColor(series);
        return objListColor;
    }

}

