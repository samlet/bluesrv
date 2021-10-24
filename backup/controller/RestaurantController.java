package com.bluecc.bluesrv.bot.controller;

import com.bluecc.bluesrv.bot.entity.Restaurant;
import com.bluecc.bluesrv.bot.service.IRestaurantService;

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
 *  RestaurantController
 *  <pre>
 *  $ curl localhost:8088/bot/restaurant/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/bot/restaurant")
public class RestaurantController {
    private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class);

    @Autowired
    private IRestaurantService restaurantService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<Restaurant> create(@RequestBody Restaurant o)
            throws URISyntaxException {
        boolean createdStudent = restaurantService.save(o);
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
    public ResponseEntity<Restaurant> read(@PathVariable Integer id) {
        Restaurant found= restaurantService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody Restaurant o) {
        boolean updated = restaurantService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = restaurantService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}