package ra.springmvc_db_hibernate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ra.springmvc_db_hibernate.entity.Product;
import ra.springmvc_db_hibernate.service.ProductService;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping(value = {"/products", "/loadProducts"})
    public String loadProducts(@RequestParam(value = "searchName", required = false) String searchName, Model model) {
        List<Product> list;
        if (searchName != null && !searchName.trim().isEmpty()) {
            list = productService.searchProductsByName(searchName);
        } else {
            list = productService.getAllProducts();
        }
        model.addAttribute("list", list);
        model.addAttribute("searchName", searchName);
        return "listProduct";
    }

    @GetMapping(value = {"/initInsertProduct", "/initAddProduct"})
    public String initInsertProduct(Model model) {
        Product product = new Product();
        product.setStatus(true); // Mặc định là còn hàng / đang bán
        model.addAttribute("product", product);
        return "addProduct";
    }

    @PostMapping("/insertProduct")
    public String insertProduct(@ModelAttribute("product") Product product, Model model, RedirectAttributes redirectAttributes) {
        boolean result = productService.saveProduct(product);
        if (result) {
            redirectAttributes.addFlashAttribute("message", "Thêm mới sản phẩm thành công!");
            return "redirect:/loadProducts";
        } else {
            model.addAttribute("err", "Thêm mới sản phẩm thất bại!");
            model.addAttribute("product", product);
            return "addProduct";
        }
    }

    @GetMapping(value = {"/initUpdateProduct", "/initEditProduct"})
    public String initUpdateProduct(@RequestParam("productId") Integer productId, Model model) {
        Product product = productService.getProductById(productId);
        if (product == null) {
            return "redirect:/loadProducts";
        }
        model.addAttribute("product", product);
        return "editProduct";
    }

    @PostMapping("/updateProduct")
    public String updateProduct(@ModelAttribute("product") Product product, Model model, RedirectAttributes redirectAttributes) {
        boolean result = productService.updateProduct(product);
        if (result) {
            redirectAttributes.addFlashAttribute("message", "Cập nhật sản phẩm thành công!");
            return "redirect:/loadProducts";
        } else {
            model.addAttribute("err", "Cập nhật sản phẩm thất bại!");
            model.addAttribute("product", product);
            return "editProduct";
        }
    }

    @GetMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("productId") Integer productId, RedirectAttributes redirectAttributes) {
        boolean result = productService.deleteProduct(productId);
        if (result) {
            redirectAttributes.addFlashAttribute("message", "Xóa sản phẩm thành công!");
        } else {
            redirectAttributes.addFlashAttribute("err", "Xóa sản phẩm thất bại!");
        }
        return "redirect:/loadProducts";
    }

    @GetMapping("/detailProduct")
    public String detailProduct(@RequestParam("productId") Integer productId, Model model) {
        Product product = productService.getProductById(productId);
        if (product == null) {
            return "redirect:/loadProducts";
        }
        model.addAttribute("product", product);
        return "detailProduct";
    }
}

