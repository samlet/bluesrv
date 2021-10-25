package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.SkuSaleAttrValue;
import com.bluecc.bluesrv.gmall.service.ISkuSaleAttrValueService;

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
 *  SkuSaleAttrValueController
 *  <pre>
 *  $ curl localhost:8088/gmall/sku_sale_attr_value/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/sku_sale_attr_value")
public class SkuSaleAttrValueController {
    private static final Logger logger = LoggerFactory.getLogger(SkuSaleAttrValueController.class);

    @Autowired
    private ISkuSaleAttrValueService skuSaleAttrValueService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<SkuSaleAttrValue> create(@RequestBody SkuSaleAttrValue o)
            throws URISyntaxException {
        boolean createdStudent = skuSaleAttrValueService.save(o);
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
    public ResponseEntity<SkuSaleAttrValue> read(@PathVariable Integer id) {
        SkuSaleAttrValue found= skuSaleAttrValueService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody SkuSaleAttrValue o) {
        boolean updated = skuSaleAttrValueService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = skuSaleAttrValueService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


