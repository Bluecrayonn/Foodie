package controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import models.IngredientDao;

@Controller
@RequestMapping("/foodie/write")
public class RegisterIngredientController {
	@Autowired
	IngredientDao ingredientDao;

	@RequestMapping("register_ingredient.do")
	@ResponseBody
	public String registerIngredient(@RequestParam Map<String,Object> map) {
		ingredientDao.registIngredientPrice(map);
		return map.toString();
	}
	
	@RequestMapping("ingredient_exist.do")
	@ResponseBody
	public boolean isExist(@RequestParam String name) {
		Map map = ingredientDao.getIngredientByName(name);
		return map != null;
	}
}