package ru.Daniilscram.simple_web_application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.Daniilscram.simple_web_application.domain.Role;
import ru.Daniilscram.simple_web_application.domain.User;
import ru.Daniilscram.simple_web_application.repository.UserRepository;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> map){
        User userName = userRepository.findByUsername(user.getUsername());
        if(userName!=null){
            map.put("message", "Пользователь с таким именем уже существует");
            return "registration";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepository.save(user);
        return "redirect:/login";
    }
}
