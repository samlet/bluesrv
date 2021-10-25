package com.bluecc.bluesrv.gmall.controller;

import com.bluecc.bluesrv.gmall.entity.SpuSaleAttrValue;
import com.bluecc.bluesrv.gmall.service.ISpuSaleAttrValueService;

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
 *  SpuSaleAttrValueController
 *  <pre>
 *  $ curl localhost:8088/gmall/spu_sale_attr_value/ping
 *  </pre>
 * </p>
 *
 * @author samlet
 * @since 2021-10-25
 */
@RestController
@RequestMapping("/gmall/spu_sale_attr_value")
public class SpuSaleAttrValueController {
    private static final Logger logger = LoggerFactory.getLogger(SpuSaleAttrValueController.class);

    @Autowired
    private ISpuSaleAttrValueService spuSaleAttrValueService;

    @RequestMapping(value = "ping", method = RequestMethod.GET)
    @ResponseBody
    public String ping(){
        return "pong";
    }

    @PostMapping("/")
    public ResponseEntity<SpuSaleAttrValue> create(@RequestBody SpuSaleAttrValue o)
            throws URISyntaxException {
        boolean createdStudent = spuSaleAttrValueService.save(o);
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
    public ResponseEntity<SpuSaleAttrValue> read(@PathVariable Integer id) {
        SpuSaleAttrValue found= spuSaleAttrValueService.getById(id);
        if (found == null) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(found);
        }
    }

    @PutMapping("/")
    public ResponseEntity<Boolean> update(@RequestBody SpuSaleAttrValue o) {
        boolean updated = spuSaleAttrValueService.saveOrUpdate(o);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Integer id) {
        boolean updated = spuSaleAttrValueService.removeById(id);
        if (!updated) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(updated);
        }
    }
}


