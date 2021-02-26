package ru.Daniilscram.simple_web_application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import ru.Daniilscram.simple_web_application.domain.User;
import ru.Daniilscram.simple_web_application.domain.dto.CaptchaResponseDTO;
import ru.Daniilscram.simple_web_application.service.UserService;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    private static final String URL_CAPTCHA = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;

    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam("passwordConfirmation") String  passwordConfirmation,
                          @RequestParam("g-recaptcha-response") String captchaResponse,
                          @Valid User user, BindingResult bindingResult, Model map){
        String url = String.format(URL_CAPTCHA, secret, captchaResponse);
        CaptchaResponseDTO response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDTO.class);

        if(!response.isSuccess()){
            map.addAttribute("captchaError", "Проверка не успешна");
        }

        boolean empty = StringUtils.isEmpty(passwordConfirmation);
        if(empty){
            map.addAttribute("passwordConfirmation", "Подтверждение пароля не должно быть пустым");
        }
        if(user.getPassword() != null && !user.getPassword().equals(passwordConfirmation)){
            map.addAttribute("passwordError", "Пароли не совпадают");
        }

        if(empty || bindingResult.hasErrors() || !response.isSuccess()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            map.mergeAttributes(errors);
            return "registration";
        }

        if(!userService.addUser(user)){
            map.addAttribute("usernameError", "Пользователь с таким именем уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){
        boolean isActivated = userService.activateUser(code);

        if(isActivated){
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Activation code is not found");
        }

        return "login";
    }
}
