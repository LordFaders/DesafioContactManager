package com.desafiolatam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.desafiolatam.models.Contacto;

@Controller
@RequestMapping("/contactManager")
public class ContactManagerController {
	@Autowired
	Contacto contacto;
	
	private List<Contacto> listaContactos;
	
	ContactManagerController(){
		super();
		listaContactos = new ArrayList<Contacto>();
		
	}
	
	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String getContactList(ModelMap model) {
		
		if(contacto.getId() > 0) {
			listaContactos.add(contacto);
		}
		
		model.put("listaContactos", listaContactos);
		
		return "contactManager.jsp";
	}
	// desplegar jsp
	@RequestMapping("")
	public String showContactManager() {

		return "contactManager.jsp";
	}

	@RequestMapping(value="/crearContacto", method = RequestMethod.POST)
	public String crearContacto(ModelMap model, @ModelAttribute("contacto") Contacto contacto) {
		contacto.setId(listaContactos.size()+1);
		listaContactos.add(contacto);
		model.put("listaContactos", listaContactos);
		
System.out.println(listaContactos);
		return "contactManager.jsp";
	}
	@RequestMapping(value="/borrarContacto", method = RequestMethod.GET)
	public String borrarContacto(ModelMap model, @RequestParam("id") int id) {
		listaContactos.remove(id - 1);
		model.put("listaContactos", listaContactos);
		return "contactManager.jsp";
	}
}
