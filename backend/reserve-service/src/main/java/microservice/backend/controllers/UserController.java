package microservice.backend.controllers;

import lombok.RequiredArgsConstructor;
import microservice.backend.entities.UserEntity;
import microservice.backend.services.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reserves/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/")
    public ResponseEntity<List<UserEntity>> listUsers() {
        List<UserEntity> users = userService.getUsers();
        return ResponseEntity.ok(users);
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserEntity> getUserById(@PathVariable Long id) {
        UserEntity user = userService.getUserById(id);
        return ResponseEntity.ok(user);
    }

    @PostMapping("/")
    public ResponseEntity<UserEntity> saveUser(@RequestBody UserEntity user) {
        UserEntity userNew = userService.saveUser(user);
        return ResponseEntity.ok(userNew);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUserById(@PathVariable Long id) {
        try {
            userService.deleteUser(id);
            return ResponseEntity.noContent().build();
        } catch (UserService.UserNotFoundException ex) {
            return ResponseEntity.notFound().build();
        }
    }
}