package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.BaseTrademark;
import com.bluecc.bluesrv.gmall.service.IBaseTrademarkService;

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
 *  BaseTrademarkController
 *  <pre>
 *  $ curl localhost:8088/gmall/base_trademark/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/base_trademark")
public class BaseTrademarkController {
    private static final Logger logger = LoggerFactory.getLogger(BaseTrademarkController.class);

    @Autowired
    private IBaseTrademarkService baseTrademarkService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<BaseTrademark> create(@RequestBody BaseTrademark o)
            throws URISyntaxException {
        boolean createdStudent = baseTrademarkService.save(o);
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
    public ResponseEntity<BaseTrademark> read(@PathVariable Integer id) {
        BaseTrademark found= baseTrademarkService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody BaseTrademark o) {
        boolean updated = baseTrademarkService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = baseTrademarkService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


