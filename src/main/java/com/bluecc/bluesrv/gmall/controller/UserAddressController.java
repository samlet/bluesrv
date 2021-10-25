package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.UserAddress;
import com.bluecc.bluesrv.gmall.service.IUserAddressService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.net.URISyntaxException;

/**
 * <p>
 *  UserAddressController
 *  <pre>
 *  $ curl localhost:8088/gmall/user_address/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/user_address")
public class UserAddressController {
    private static final Logger logger = LoggerFactory.getLogger(UserAddressController.class);

    @Autowired
    private IUserAddressService userAddressService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<UserAddress> create(@RequestBody UserAddress o)
            throws URISyntaxException {
        boolean createdStudent = userAddressService.save(o);
        if (!createdStudent) {
            return ResponseEntity.notFound().build();
        } else {
            URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
                    .path("/{id}")
                    .buildAndExpand(o.getId())
                    .toUri();

            return ResponseEntity.created(uri)
                    .body(o);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserAddress> read(@PathVariable Integer id) {
        UserAddress found= userAddressService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody UserAddress o) {
        boolean updated = userAddressService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = userAddressService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


