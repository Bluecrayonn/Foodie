package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import services.IngredientPriceUpdateService;

@Controller
@RequestMapping("/admin")
public class IngredientPriceController {
	@Autowired
	IngredientPriceUpdateService service;
	
	@RequestMapping("/ingredient/update.do")
	@ResponseBody
	public String updatePrice() {
		service.updatePriceAll();
		return "업데이트완료";
	}
}
