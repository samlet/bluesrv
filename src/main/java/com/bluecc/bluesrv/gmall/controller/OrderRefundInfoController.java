package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.OrderRefundInfo;
import com.bluecc.bluesrv.gmall.service.IOrderRefundInfoService;

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
 *  OrderRefundInfoController
 *  <pre>
 *  $ curl localhost:8088/gmall/order_refund_info/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/order_refund_info")
public class OrderRefundInfoController {
    private static final Logger logger = LoggerFactory.getLogger(OrderRefundInfoController.class);

    @Autowired
    private IOrderRefundInfoService orderRefundInfoService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<OrderRefundInfo> create(@RequestBody OrderRefundInfo o)
            throws URISyntaxException {
        boolean createdStudent = orderRefundInfoService.save(o);
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
    public ResponseEntity<OrderRefundInfo> read(@PathVariable Integer id) {
        OrderRefundInfo found= orderRefundInfoService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody OrderRefundInfo o) {
        boolean updated = orderRefundInfoService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = orderRefundInfoService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


