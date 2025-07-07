package microservice.backend.controllers;

import lombok.RequiredArgsConstructor;
import microservice.backend.entities.UserEntity;
import microservice.backend.services.UserService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
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

    // RF5 Performance Optimization: Cache paginated user queries
    @GetMapping("/paginated")
    @Cacheable(value = "usersPaginated", key = "#page + '_' + #size + '_' + #sortBy + '_' + #sortDir", unless = "#result == null")
    public ResponseEntity<Page<UserEntity>> listUsersPaginated(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir) {
        
        Page<UserEntity> users = userService.getUsersPaginated(page, size, sortBy, sortDir);
        return ResponseEntity.ok(users);
    }

    // RF5 Performance Optimization: Cache user search results 
    @GetMapping("/search")
    @Cacheable(value = "userSearch", key = "(#searchTerm ?: 'empty') + '_' + #page + '_' + #size + '_' + #sortBy + '_' + #sortDir", unless = "#result == null")
    public ResponseEntity<Page<UserEntity>> searchUsers(
            @RequestParam(required = false) String searchTerm,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir) {
        
        Page<UserEntity> users = userService.searchUsers(searchTerm, page, size, sortBy, sortDir);
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