/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.BindingType;
import mirora.admin.model.CategoriesModel;
import mirora.admin.model.ColorModel;
import mirora.admin.model.ProductModel;
import mirora.entity.CatProduct;
import mirora.entity.Categories;
import mirora.entity.Colors;
import mirora.entity.Images;
import mirora.entity.Product;
import mirora.entity.ProductDetail;
import mirora.util.MyUploadFile;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Thanh Nam
 */
@Controller
@RequestMapping(value = "/productController")
public class ProductController {

    private ProductModel proModel;
    private CategoriesModel catModel;
    private ColorModel colorModel;

    public ProductController() {
        proModel = new ProductModel();
        catModel = new CategoriesModel();
        colorModel = new ColorModel();
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // Custom String Editor. tell spring to set empty values as null instead of empty string.
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));

        //Custom Date Editor
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        simpleDateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, true));
    }

    @RequestMapping(value = "/getAll")
    public ModelAndView getAllProduct() {
        ModelAndView mav = new ModelAndView("admin/jsp/listProduct");
        List<Product> listPro = proModel.getAllPro();
        mav.addObject("listPro", listPro);
        return mav;
    }

    @RequestMapping(value = "/preInsert")
    public ModelAndView preInsert() {
        ModelAndView mav = new ModelAndView("admin/jsp/newproduct");
        Product pro = new Product();
        List<Categories> listCat = catModel.getAllCat();
        List<Colors> listColor = colorModel.getAllColor();
        mav.addObject("proNew", pro);
        mav.addObject("listCat", listCat);
        mav.addObject("listColor", listColor);
        return mav;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insertProduct(Product proNew, HttpServletRequest request, @RequestParam(value = "imageMain1") MultipartFile imageMain, @RequestParam(value = "imageOther1") MultipartFile[] imageOther) {
        proNew.setImageMain(new MyUploadFile().saveImageToFolder(request, imageMain));
        List<Images> listImageOther = new ArrayList<>();
        for (MultipartFile other : imageOther) {
            //Khoi tao doi tuong ProductImages trong danh sach anh phu cua product
            Images img = new Images();
            img.setProduct(new Product(proNew.getProductId()));
            img.setImageLink(new MyUploadFile().saveImageToFolder(request, other));
            img.setImageStatus(true);
            listImageOther.add(img);
        }
        //Convert listImageOther to Set
        Set<Images> setImage = new HashSet(listImageOther);
        proNew.setImageses(setImage);
        List<CatProduct> listCatPro = new ArrayList<>();
        for (String catId : proNew.getListCate()) {
            CatProduct catpro = new CatProduct();
            catpro.setProduct(proNew);
            Categories c = new Categories(Integer.parseInt(catId));
            catpro.setCategories(c);
            listCatPro.add(catpro);
        }

        List<ProductDetail> listProDetail = new ArrayList<>();
        List<String> listColors = proNew.getColors();
        List<String> listQuantites = proNew.getQuantity();
        for (int i = 0; i < listColors.size(); i++) {
            ProductDetail proDetail = new ProductDetail();
            proDetail.setProduct(proNew);
            Colors c = new Colors(Integer.parseInt(listColors.get(i)));
            proDetail.setColors(c);
            for (int j = i; j < listQuantites.size(); j++) {
                if (listQuantites.get(j) != null && listQuantites.get(j).length() > 0){
                    proDetail.setQuantity(Integer.parseInt(listQuantites.get(j)));
                    proDetail.setProductDtStatus(true);
                    listProDetail.add(proDetail);
                    break;
                }
            
            }
        }

        Set<ProductDetail> setProDetail = new HashSet(listProDetail);
        Set<CatProduct> setCatPro = new HashSet(listCatPro);
        proNew.setProductView(0);
        proNew.setCatProducts(setCatPro);
        proNew.setProductDetails(setProDetail);

        boolean check = proModel.insertProduct(proNew);
        if (check) {
            return "redirect:getAll.htm";
        } else {
            return "admin/jsp/error";
        }

    }

    @RequestMapping(value = "/prodetail")
    public ModelAndView productDetail(String proId) {
        ModelAndView mav = new ModelAndView("admin/jsp/prodetail");
        Product pro = proModel.getProductById(proId);
        mav.addObject("pro", pro);
        return mav;
    }

    @RequestMapping(value = "/preUpdate")
    public ModelAndView preUpdate(String proId) {
        ModelAndView mav = new ModelAndView("admin/jsp/updateProduct");
        Product proUp = proModel.getProductById(proId);
        List<String> listCate = new ArrayList<>();
        for (Object obj : proUp.getCatProducts()) {
            CatProduct cp = (CatProduct) obj;
            listCate.add(cp.getCategories().getCatalogId()+ "");
        }
        proUp.setListCate(listCate);

        List<Colors> listColor = colorModel.getAllColor();
        mav.addObject("listColor", listColor);

        List<String> colors = new ArrayList<>();
        List<String> quantity = new ArrayList<>();

        Set productDetails = proUp.getProductDetails();
        for (Object obj : productDetails) {
            ProductDetail pd = (ProductDetail) obj;
            Colors cc = pd.getColors();
            colors.add(cc.getColorName());

            Integer qq = pd.getQuantity();
            quantity.add(qq + "");
        }
        proUp.setColors(colors);
        proUp.setQuantity(quantity);

        mav.addObject("listColorSelected", colors);
        List<String> listQQ = new ArrayList<>(listColor.size());
        for (int i = 0; i < listColor.size(); i++) {
            boolean choice = false;
            Colors c0 = listColor.get(i);
            for (int j = 0; j < colors.size(); j++) {
                if (colors.get(j).equals(c0.getColorName())) {
                    choice = true;
                    listQQ.add(quantity.get(j));
                    break;
                }
            }
            if (!choice) {
                listQQ.add("");
            }
        }
        mav.addObject("listQuantiies", listQQ);

        List<Categories> allCat = catModel.getAllCat();
        mav.addObject("proUp", proUp);
        mav.addObject("loadCate", allCat);
        return mav;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateProduct(Product proUp, HttpServletRequest request, @RequestParam(value = "imageMain1") MultipartFile imageMain, @RequestParam(value = "imageOther1") MultipartFile[] imageOther) {
        
        boolean check = proModel.updateProduct(proUp);
        if (check) {
            return "redirect:getAll.htm";
        } else {
            return "admin/jsp/error";
        }
    }

}
