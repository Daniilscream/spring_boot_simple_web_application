package ru.Daniilscram.simple_web_application.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.Daniilscram.simple_web_application.domain.User;

public interface UserRepository extends JpaRepository<User,Long> {

    User findByUsername(String username);
}
