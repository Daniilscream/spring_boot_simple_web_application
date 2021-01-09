package ru.Daniilscram.simple_web_application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.Daniilscram.simple_web_application.domain.Message;
import ru.Daniilscram.simple_web_application.repository.MessageRepository;

import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String,Object> map){
        Iterable<Message> messages = messageRepository.findAll();
        map.put("messages", messages);
        return "main";
    }

    @PostMapping("/main")
    public String add(@RequestParam String text, @RequestParam String tag, Map<String,Object> map){
        Message message = new Message(text,tag);
        messageRepository.save(message);
        Iterable<Message> messages = messageRepository.findAll();
        map.put("messages", messages);
        return "main";
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter, Map<String,Object> map){
        Iterable<Message> messages;
        if(filter!=null&&!filter.isEmpty()) {
            messages = messageRepository.findByTag(filter);
        } else {
            messages = messageRepository.findAll();
        }
        map.put("messages", messages);
        return "main";
    }
}