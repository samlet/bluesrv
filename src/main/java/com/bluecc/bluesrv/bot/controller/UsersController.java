package com.bluecc.bluesrv.bot.controller;


import com.bluecc.bluesrv.bot.entity.Users;
import com.bluecc.bluesrv.bot.service.IUsersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.net.URISyntaxException;

/**
 * <p>
 *  前端控制器
 *  $ curl localhost:8088/bot/users/ping
 * </p>
 *
 * @author samlet
 * @since 2021-10-17
 */
@RestController
@RequestMapping("/bot/users")
public class UsersController {
    private static final Logger LOGGER = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private IUsersService usersService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<Users> create(@RequestBody Users student)
            throws URISyntaxException {
        boolean createdStudent = usersService.save(student);
        if (!createdStudent) {
            return ResponseEntity.notFound().build();
        } else {
            URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
                    .path("/{id}")
                    .buildAndExpand(student.getId())
                    .toUri();

            return ResponseEntity.created(uri)
                    .body(student);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Users> read(@PathVariable Integer id) {
        Users found= usersService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

}

