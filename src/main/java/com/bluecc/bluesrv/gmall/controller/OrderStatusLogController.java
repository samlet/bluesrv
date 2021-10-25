package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.OrderStatusLog;
import com.bluecc.bluesrv.gmall.service.IOrderStatusLogService;

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
 *  OrderStatusLogController
 *  <pre>
 *  $ curl localhost:8088/gmall/order_status_log/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/order_status_log")
public class OrderStatusLogController {
    private static final Logger logger = LoggerFactory.getLogger(OrderStatusLogController.class);

    @Autowired
    private IOrderStatusLogService orderStatusLogService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<OrderStatusLog> create(@RequestBody OrderStatusLog o)
            throws URISyntaxException {
        boolean createdStudent = orderStatusLogService.save(o);
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
    public ResponseEntity<OrderStatusLog> read(@PathVariable Integer id) {
        OrderStatusLog found= orderStatusLogService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody OrderStatusLog o) {
        boolean updated = orderStatusLogService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = orderStatusLogService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


