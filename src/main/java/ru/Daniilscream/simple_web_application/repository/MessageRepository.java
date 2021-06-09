package ru.Daniilscream.simple_web_application.repository;

import org.springframework.data.repository.CrudRepository;
import ru.Daniilscream.simple_web_application.domain.Message;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message,Long> {

    List<Message> findByTag(String tag);
}
