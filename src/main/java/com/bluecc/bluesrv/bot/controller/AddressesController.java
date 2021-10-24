package com.bluecc.bluesrv.bot.controller;

import com.bluecc.bluesrv.bot.entity.Addresses;
import com.bluecc.bluesrv.bot.service.IAddressesService;

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
 *  AddressesController
 *  <pre>
 *  $ curl localhost:8088/bot/addresses/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/bot/addresses")
public class AddressesController {
    private static final Logger logger = LoggerFactory.getLogger(AddressesController.class);

    @Autowired
    private IAddressesService addressesService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<Addresses> create(@RequestBody Addresses o)
            throws URISyntaxException {
        boolean createdStudent = addressesService.save(o);
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
    public ResponseEntity<Addresses> read(@PathVariable Integer id) {
        Addresses found= addressesService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody Addresses o) {
        boolean updated = addressesService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = addressesService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


