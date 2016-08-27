package com.jlearning.shopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.jlearning.shopping.action.CategoryAndProductManager;
import com.jlearning.shopping.action.CustomerManager;
import com.jlearning.shopping.model.Cart;
import com.jlearning.shopping.model.Category;
import com.jlearning.shopping.model.CategoryList;
import com.jlearning.shopping.model.Customer;
import com.jlearning.shopping.model.Product;
import com.jlearning.shopping.model.ProductMap;

@Controller
@SessionAttributes("customer")
public class ShoppingCartController {
	
	private static final Logger LOG = Logger.getLogger(ShoppingCartController.class);
	
	@Autowired
	@Qualifier("customerManager")
	private CustomerManager cm;

	@Autowired
	@Qualifier("catAndProdManager")
	private CategoryAndProductManager cpm;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request){
		System.out.println("Inside login.htm");
		LOG.info("Inside login.htm");
		if(isSessionValid(request.getSession(false))){
			LOG.info("Valid Session");
			System.out.println("Valid Session");
			return new ModelAndView("displayCategories","category",new Category());
		}
		else{
			LOG.info("Invalid Session");
			System.out.println("Invalid Session");
			return new ModelAndView("login","customer",new Customer());
		}
	}
	
	
	@RequestMapping(value="/validateLogin",method=RequestMethod.POST)
	public String validateLogin(
			@ModelAttribute("customer") @Valid Customer customer, BindingResult result, 
			ModelMap model, HttpServletRequest request){
		
		System.out.println("Inside /validateLogin");
		if(!result.hasErrors()){
			HttpSession session = request.getSession(false);
			if(isSessionValid(session)){
				System.out.println("Valid Session");
				return "redirect:/displayCategories.htm";					
			}
			else{
				System.out.println("Invalid Session");
				if(cm.isValidCustomer(customer)){
					System.out.println("Set up new session and a cart");
					// Create a new session
					session = request.getSession(true);
					
					// Add an empty cart to the session.
					Cart cart = new Cart();
					session.setAttribute("cart", cart);
					
					// Add customer to the session
					session.setAttribute("customer", customer);
					return "redirect:/displayCategories.htm";
				}
				else{
					result.reject("invalid.user");
					return "redirect:/login.htm";
				}
			}
		}
		else{
			return "redirect:/login.htm";
		}
	}
	
		
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public ModelAndView logoutUser(HttpServletRequest request){
		System.out.println("Inside logout.htm");
		LOG.info("Inside logout.htm");
		if(null != request.getSession(false)){
			LOG.info("Invalidate the Session");
			request.getSession().invalidate();
		}
		ModelAndView mav = new ModelAndView("login","customer",new Customer());
		String message = "You have been logged out successfully";
		mav.addObject("message", message);
		return mav;
	}
	
	private boolean isSessionValid(HttpSession session){
		if(null != session){
			Object custObj = session.getAttribute("customer");
			Object cartObj = session.getAttribute("cart");
			if(null != custObj && null != cartObj){
				if(custObj instanceof Customer && cartObj instanceof Cart){
					Customer cust = (Customer) custObj;
					if(null != cust && !StringUtils.isEmpty(cust.getUsername())){
						return true;
					}
				}
			}
		}
		return false;
	}
	
	@RequestMapping(value="/displayCategories",method=RequestMethod.GET)
	public String displayCategories(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(isSessionValid(session)){
			// Get product categories and add them to the session 
			// so that they are available on the next page
			CategoryList catList = cpm.retrieveProductCategories();
			session.setAttribute("categoryList", catList);
			return "displayCategories";
		}			
		
		return "redirect:/login.htm";
	}
	
	/** This call is for form submit
	@RequestMapping(value="/retrieveProducts",method=RequestMethod.GET)
	public ModelAndView retrieveProducts(
			@ModelAttribute("category") Category category,
			ModelMap model, HttpServletRequest request){
		// Retrieve the products for the selected category
		ProductMap prodMap = cpm.retrieveProductsByCategory(category);
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		if(null != session){
			// Add the product map to the existing session
			session.setAttribute("productMap", prodMap);
			return new ModelAndView("showProducts", "itemSelection", new Selection());
		}
		else{
			// If the session has expired then user will have to login again
			return new ModelAndView("login","customer",new Customer());
		}
	}
	*/
	
	// This call is for AJAX
	@RequestMapping(value="/retrieveProducts", method=RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public ProductMap retrieveProducts(@RequestParam(required=true) int categoryId, HttpServletRequest request, HttpServletResponse response){
		// Retrieve the products for the selected category
		System.out.println("Inside retrieveProducts.htm "+categoryId);
		ProductMap prodMap = null;
		HttpSession session = request.getSession(false);
		if(isSessionValid(session)){
			Category category = new Category();
			category.setId(categoryId);
			prodMap = cpm.retrieveProductsByCategory(category);
			for(String key : prodMap.getProductMap().keySet()){
				System.out.println(prodMap.getProductMap().get(key).getName());
			}			
		}
		else{
			response.setStatus(400);
		}
		//response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
		return prodMap;
	}
	
	/*@RequestMapping(value="/showProducts",method=RequestMethod.GET)
	public ModelAndView showProducts(
			@ModelAttribute("category") Category category,
			ModelMap model, HttpServletRequest request){
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		if(null != session){
			return new ModelAndView("showProducts", "itemSelection", new Selection());
		}
		else{
			// If the session has expired then user will have to login again
			return new ModelAndView("login","customer",new Customer());
		}
	}*/
	
	@RequestMapping(value="/viewProductDetails",method=RequestMethod.GET)
	public ModelAndView viewProductDetails(
			@RequestParam(required=true) int productId,
			ModelMap model, HttpServletRequest request){
		System.out.println("Inside viewProductDetails.htm "+productId);
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		Product product = null;
		if(isSessionValid(session)){
			product = cpm.retrieveProductById(Integer.valueOf(productId));
			if(null != product){
				System.out.println(product.getName());
			}
			else{
				System.out.println("No product found with id : "+productId);
			}
			
			return new ModelAndView("viewProductDetails", "productDetails", product);
		}
		else{
			// If the session has expired then user will have to login again
			return new ModelAndView("login","customer",new Customer());
		}
	}
	
	/*@RequestMapping(value="/addToCart",method=RequestMethod.POST)
	public ModelAndView addToCart(
			@ModelAttribute("itemSelection") Selection items,
			ModelMap model, HttpServletRequest request){
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		if(null != session){
			ProductMap prodMap = (ProductMap)session.getAttribute("productMap");
			Cart cart = (Cart)session.getAttribute("cart");
			cart.addToCart(prodMap, items);
			session.setAttribute("cart", cart);
			return new ModelAndView("showProducts","itemSelection",new Selection());
		}
		else{
			// If the session has expired then user will have to login again
			return new ModelAndView("login","customer",new Customer());
		}
	}*/
	
	@RequestMapping(value="/addToCart", method=RequestMethod.POST)
	public String addToCart(@ModelAttribute("productDetails") Product product,
			HttpServletRequest request, HttpServletResponse response){
		System.out.println("Inside /addToCart, product : "+product.getName());
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		if(isSessionValid(session)){
			Cart cart = (Cart)session.getAttribute("cart");
			if(null == cart){
				System.out.println("Session Cart is null!");
			}
			cart.addToCart(product);
			session.setAttribute("cart", cart);
			return "redirect:/showCart.htm";
		}
		else{
			// If the session has expired then user will have to login again
			return "redirect:/login.htm";
		}
	}
	
	@RequestMapping(value="/showCart",method=RequestMethod.GET)
	public String showCart(HttpServletRequest request){
		System.out.println("Inside /showCart");
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		if(isSessionValid(session)){
			return "showCart";
		}
		else{
			// If the session has expired then user will have to login again
			return "redirect:/login.htm";
		}
	}
	
	@RequestMapping(value="/updateCart", method=RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public Cart updateCart(@RequestBody Product product, HttpServletRequest request, HttpServletResponse response){
		System.out.println("Inside /updateCart, product : "+product.getId());
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		if(isSessionValid(session)){
			Cart cart = (Cart)session.getAttribute("cart");
			cart.updateCart(product);
			session.setAttribute("cart", cart);
			return cart;
		}
		else{
			// If the session has expired then user will have to login again
			response.setStatus(400);
			return null;
		}
	}
	
	@RequestMapping(value="/accountSettings", method=RequestMethod.GET)
	public String getAccountSettings(HttpServletRequest request, HttpServletResponse response){
		System.out.println("Inside /accountSettings");
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		if(isSessionValid(session)){
			return "accountSetting";
		}
		else{
			// If the session has expired then user will have to login again
			return "redirect:/login.htm";
		}
	}
	
	@RequestMapping(value="/orderHistory", method=RequestMethod.GET)
	public String getOrderHistory(HttpServletRequest request, HttpServletResponse response){
		System.out.println("Inside /orderHistory");
		// Retrieve the existing session
		HttpSession session = request.getSession(false);
		if(isSessionValid(session)){
			return "orderHistory";
		}
		else{
			// If the session has expired then user will have to login again
			return "redirect:/login.htm";
		}
	}
}
