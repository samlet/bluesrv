package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.BaseAttrValue;
import com.bluecc.bluesrv.gmall.service.IBaseAttrValueService;

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
 *  BaseAttrValueController
 *  <pre>
 *  $ curl localhost:8088/gmall/base_attr_value/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/base_attr_value")
public class BaseAttrValueController {
    private static final Logger logger = LoggerFactory.getLogger(BaseAttrValueController.class);

    @Autowired
    private IBaseAttrValueService baseAttrValueService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<BaseAttrValue> create(@RequestBody BaseAttrValue o)
            throws URISyntaxException {
        boolean createdStudent = baseAttrValueService.save(o);
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
    public ResponseEntity<BaseAttrValue> read(@PathVariable Integer id) {
        BaseAttrValue found= baseAttrValueService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody BaseAttrValue o) {
        boolean updated = baseAttrValueService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = baseAttrValueService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


