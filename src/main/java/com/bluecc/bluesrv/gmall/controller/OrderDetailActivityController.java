package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.OrderDetailActivity;
import com.bluecc.bluesrv.gmall.service.IOrderDetailActivityService;

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
 *  OrderDetailActivityController
 *  <pre>
 *  $ curl localhost:8088/gmall/order_detail_activity/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/order_detail_activity")
public class OrderDetailActivityController {
    private static final Logger logger = LoggerFactory.getLogger(OrderDetailActivityController.class);

    @Autowired
    private IOrderDetailActivityService orderDetailActivityService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<OrderDetailActivity> create(@RequestBody OrderDetailActivity o)
            throws URISyntaxException {
        boolean createdStudent = orderDetailActivityService.save(o);
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
    public ResponseEntity<OrderDetailActivity> read(@PathVariable Integer id) {
        OrderDetailActivity found= orderDetailActivityService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody OrderDetailActivity o) {
        boolean updated = orderDetailActivityService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = orderDetailActivityService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


