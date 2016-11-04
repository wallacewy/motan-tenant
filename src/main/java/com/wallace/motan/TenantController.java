package com.wallace.motan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

/**
 * Created by I310818 on 11/2/2016.
 */
@Controller
@EnableAutoConfiguration
@ImportResource("motan_tenant.xml")
public class TenantController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ShippingService shippingService;

    @RequestMapping("/")
    @ResponseBody
    public String home() {
        StringBuilder greetings = new StringBuilder();
        greetings.append(customerService.hello("Motan"));
        greetings.append("<br/>");
        greetings.append(employeeService.hello("Motan"));
        greetings.append("<br/>");
        greetings.append(itemService.hello("Motan"));
        greetings.append("<br/>");
        greetings.append(orderService.hello("Motan"));
        greetings.append("<br/>");
        greetings.append(shippingService.hello("Motan"));
        return greetings.toString();
    }

    public static void main(String[] args) throws Exception {
        ConfigurableApplicationContext ctx = SpringApplication.run(TenantController.class, args);
    }
}
